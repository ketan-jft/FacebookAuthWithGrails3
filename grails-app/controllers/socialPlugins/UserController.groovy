package socialPlugins

import socialPlugins.User

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userCount: User.count()]
    }

    def show(User user) {
        respond user
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User user) {

        def results=User.findByUserNameAndEmailId(user.userName,user.emailId);
        if(!results)
        {
            redirect(action: 'index')
        }
        if(results)
        {
            session.setAttribute("UserID",results.userName);
            session.setAttribute("UserName",results.fullName);
            redirect(url: "http://localhost:8080/user/show/${results.id}");
        }
        else
        {
            user.save flush:true
        }
    }
    def login = {
        def results=User.findByUserNameAndEmailId(userName,password);
        if(results)
        {
            session.setAttribute("UserID",results.userName);
            session.setAttribute("UserName",results.fullName);
            redirect(action: 'show');
        }
        else
        {
            flash.message="Wrong Credential";
            redirect(action: 'index');
        }
    }
    def logout = {
        session.invalidate()
        redirect(url: 'http://localhost:8080')
    }
    def edit(User user) {
        respond user
    }

    def nav(){}

    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        user.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
