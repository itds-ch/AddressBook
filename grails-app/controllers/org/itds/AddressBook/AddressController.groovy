package org.itds.AddressBook



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AddressController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["GET","DELETE"]]

	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Address.list(params).grep{it.person.adressbuch.benutzer.id == session.userId}, model:[addressInstanceCount: Address.count()]
    }

    def show(Address addressInstance) {
		respond addressInstance
    }

    def create() {
		def ownPerson = Person.list().grep{it.adressbuch.benutzer.id == session.userId} 
		[ownPersons: ownPerson]
    }

    @Transactional
    def save(Address addressInstance) {
        if (addressInstance == null) {
            notFound()
            return
        }

        if (addressInstance.hasErrors()) {
            respond addressInstance.errors, view:'create'
            return
        }

        addressInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.created.message', args: [message(code: 'address.label', default: 'Address'), addressInstance.toString()])
                redirect addressInstance
            }
            '*' { respond addressInstance, [status: CREATED] }
        }
    }

    def edit(Address addressInstance) {
		def ownPerson = addressInstance.person
		[addressInstance: addressInstance, ownPersons: ownPerson]
    }

    @Transactional
    def update(Address addressInstance) {
        if (addressInstance == null) {
            notFound()
            return
        }

        if (addressInstance.hasErrors()) {
            respond addressInstance.errors, view:'edit'
            return
        }

        addressInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.updated.message', args: [message(code: 'Address.label', default: 'Address'), addressInstance.toString()])
                redirect addressInstance
            }
            '*'{ respond addressInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Address addressInstance) {

        if (addressInstance == null) {
            notFound()
            return
        }

        switch ( request.method ){


            case "DELETE":

                def name = addressInstance.toString()

                addressInstance.delete flush:true

                request.withFormat {
                    form multipartForm {
                        flash.success = message(code: 'default.deleted.message', args: [message(code: 'Address.label', default: 'Address'), name])
                        redirect action:"index", method:"GET"
                     }
                    '*'{ render status: NO_CONTENT }
                }
                break;

            case "GET":
            default:
                [addressInstance:addressInstance]
            }

        }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'address.label', default: 'Address'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
