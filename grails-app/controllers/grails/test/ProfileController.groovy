package grails.test
import grails.plugin.springsecurity.annotation.Secured

class ProfileController {
    def springSecurityService

    @Secured('ROLE_USER')
    def index() {

        def currUser = springSecurityService.getCurrentUser()

        respond(['user': currUser])
    }



}
