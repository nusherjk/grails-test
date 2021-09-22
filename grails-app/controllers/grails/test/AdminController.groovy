package grails.test

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import com.auth.User
@Secured('ROLE_ADMIN')
class AdminController {
    def springSecurityService
    def index() {

        def currUser = springSecurityService.getCurrentUser()
        def allUserset = User.getAll()


        respond (['user':currUser, 'alluser':allUserset])

    }
    def String wrapSearchParm(value) {
        '%'+value+'%'
    }

    def searchbyname(params){

        def list = User.findAllByFirstnameIlike(wrapSearchParm(params.value))
        System.out.println(list)
        //render list as JSON
        render(template:'searchr', model:[alluser: list])
        //render "success" as JSON
    }
}
