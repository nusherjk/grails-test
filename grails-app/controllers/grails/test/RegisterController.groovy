package grails.test

import grails.converters.JSON
import grails.validation.ValidationException
import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import com.auth.User
import com.auth.Role
import com.auth.UserRole

@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }


    def checkSameEmail(params) {
        def user = User.findByUsername(params.value)
        if(user!=null){
            def data="invalid"
            render ([data:data] as JSON)
        }
        else {
            def data ="valid"
            render ([data:data] as JSON)
        }
    }

    def register() {
        if(!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } else {
            try {
                def user = User.findByUsername(params.username)?: new User(username: params.username, password: params.password, firstname: params.firstname,
                        lastname: params.lastname, phone: params.phone, address: params.address, dob: params.dob).save()
                def role = Role.findByAuthority('ROLE_USER')
                if(user && role) {
                    UserRole.create user, role

                    UserRole.withSession {
                        it.flush()
                        it.clear()
                    }

                    flash.message = "You have registered successfully. Please login."
                    redirect controller: "login", action: "auth"
                } else {
                    flash.message = "Register failed because role issue " + params.username
                    render view: "index"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Register Failed cause validation issue "
                redirect action: "index"
                return
            }
        }
    }
}