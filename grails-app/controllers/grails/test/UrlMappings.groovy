package grails.test

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller: 'login')

        "/profile"(controller: 'profile', action: 'index')
        "/admin"(controller: 'admin', action: 'index')

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
