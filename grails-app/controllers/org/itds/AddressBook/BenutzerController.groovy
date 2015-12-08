package org.itds.AddressBook



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BenutzerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["GET","DELETE"]]
	
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Benutzer.list(params), model:[benutzerInstanceCount: Benutzer.count()]
    }

    def show(Benutzer benutzerInstance) {
        respond benutzerInstance
    }

    def create() {
        respond new Benutzer(params)
    }

	
	
    @Transactional
    def save(Benutzer benutzerInstance) {
        if (benutzerInstance == null) {
            notFound()
            return
        }

        if (benutzerInstance.hasErrors()) {
            respond benutzerInstance.errors, view:'create'
            return
        }
		
		
        benutzerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.created.message', args: [message(code: 'benutzer.label', default: 'Benutzer'), benutzerInstance.toString()])
                redirect benutzerInstance
            }
            '*' { respond benutzerInstance, [status: CREATED] }
        }
    }
	

    def edit(Benutzer benutzerInstance) {
        respond benutzerInstance
    }

    @Transactional
    def update(Benutzer benutzerInstance) {
        if (benutzerInstance == null) {
            notFound()
            return
        }

        if (benutzerInstance.hasErrors()) {
            respond benutzerInstance.errors, view:'edit'
            return
        }

        benutzerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.updated.message', args: [message(code: 'Benutzer.label', default: 'Benutzer'), benutzerInstance.toString()])
                redirect benutzerInstance
            }
            '*'{ respond benutzerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Benutzer benutzerInstance) {

        if (benutzerInstance == null) {
            notFound()
            return
        }

        switch ( request.method ){


            case "DELETE":

                def name = benutzerInstance.toString()

                benutzerInstance.delete flush:true

                request.withFormat {
                    form multipartForm {
                        flash.success = message(code: 'default.deleted.message', args: [message(code: 'Benutzer.label', default: 'Benutzer'), name])
                        redirect action:"index", method:"GET"
                     }
                    '*'{ render status: NO_CONTENT }
                }
                break;

            case "GET":
            default:
                [benutzerInstance:benutzerInstance]
            }

        }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'benutzer.label', default: 'Benutzer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
