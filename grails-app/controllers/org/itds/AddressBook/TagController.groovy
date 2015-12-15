package org.itds.AddressBook



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TagController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["GET","DELETE"]]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Tag.list(params).grep{it.benutzer.id == session.userId}, model:[tagInstanceCount: Tag.count()]
    }

    def show(Tag tagInstance) {
        respond tagInstance
    }

    def create() {
		def loggedBenutzer = Benutzer.list().grep{it.id == session.userId}
		[loggedBenutzer: loggedBenutzer]
    }

    @Transactional
    def save(Tag tagInstance) {
        if (tagInstance == null) {
            notFound()
            return
        }

        if (tagInstance.hasErrors()) {
            respond tagInstance.errors, view:'create'
            return
        }

        tagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.created.message', args: [message(code: 'tag.label', default: 'Tag'), tagInstance.toString()])
                redirect tagInstance
            }
            '*' { respond tagInstance, [status: CREATED] }
        }
    }

    def edit(Tag tagInstance) {
		def loggedBenutzer = tagInstance.benutzer
		[tagInstance: tagInstance, loggedBenutzer: loggedBenutzer]
    }

    @Transactional
    def update(Tag tagInstance) {
        if (tagInstance == null) {
            notFound()
            return
        }

        if (tagInstance.hasErrors()) {
            respond tagInstance.errors, view:'edit'
            return
        }

        tagInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.updated.message', args: [message(code: 'Tag.label', default: 'Tag'), tagInstance.toString()])
                redirect tagInstance
            }
            '*'{ respond tagInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Tag tagInstance) {

        if (tagInstance == null) {
            notFound()
            return
        }

        switch ( request.method ){


            case "DELETE":

                def name = tagInstance.toString()

                tagInstance.delete flush:true

                request.withFormat {
                    form multipartForm {
                        flash.success = message(code: 'default.deleted.message', args: [message(code: 'Tag.label', default: 'Tag'), name])
                        redirect action:"index", method:"GET"
                     }
                    '*'{ render status: NO_CONTENT }
                }
                break;

            case "GET":
            default:
                [tagInstance:tagInstance]
            }

        }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
