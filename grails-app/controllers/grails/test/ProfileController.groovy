package grails.test
import grails.plugin.springsecurity.annotation.Secured

class ProfileController {
    def springSecurityService
    def passwordEncoder
    static allowedMethods = [changePassword: "POST"]
    @Secured('ROLE_USER')
    def index() {

        def currUser = springSecurityService.getCurrentUser()

        respond(['user': currUser])
    }


    @Secured('ROLE_USER')
    def changePassword(){

        def currUser = springSecurityService.getCurrentUser()
        //System.out.println(params.currpass)
        //System.out.println(params.newpass)
        //System.out.println(currUser.password)

        //if(!currUser.password.equals(springSecurityService.encodePassword(params.currpass))) {
        if (!passwordEncoder.matches( params.currpass, currUser.password)){
                flash.message = "Validation Unsuccessfull"
                redirect action: "index"
                return

        }
        else{

                currUser.setPassword(params.newpass)
                currUser.save()
                flash.message = " PassWord Changed Successfully"
                redirect action: "index"
                return
            }

    }



}
