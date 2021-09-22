package grails.test
import com.auth.User
import com.auth.Role

import com.auth.UserRole
class BootStrap {
    def user,admin,  roleu, rolea, userrole, adminrole
    def init = { servletContext ->

        userrole = Role.findOrSaveWhere(authority: 'ROLE_USER')
        adminrole = Role.findOrSaveWhere(authority: "ROLE_ADMIN")
        /*
        user = User.findOrSaveWhere(username: "new", password: "new", firstname: "params.fullname",
                lastname: "lastname", phone: "phone", address: "address")

        admin = User.findOrSaveWhere(username: "admin", password: "admin", firstname: "admin",
                lastname: "admin", phone: "admin", address: "admin")
        //roleu = Role.findByAuthority('ROLE_USER')?: new Role(id: 1, version: 1, authority: "ROLE_USER").save()
        //rolea = Role.findByAuthority('ROLE_ADMIN')?: new Role(id: 2, version: 2, authority: "ROLE_ADMIN").save()
        //roleu = UserRole.findOrSaveWhere(user: user,role: userrole, flush:false)
        //rolea = UserRole.findOrSaveWhere(user: admin, role:adminrole, flush:false)
    */
    }
    def destroy = {
    }
}
