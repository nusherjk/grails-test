import com.auth.UserPasswordEncoderListener
import com.auth.CustomUserDetailsService
import com.auth.CustomAuthenticationSuccessHandler
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(CustomUserDetailsService)
    authenticationSuccessHandler(CustomAuthenticationSuccessHandler) {
        linkGenerator = ref('grailsLinkGenerator')
        redirectStrategy = ref('redirectStrategy')
        requestCache = ref('requestCache')

        defaultTargetUrl = application.config.grails.plugin.springsecurity.successHandler.defaultTargetUrl
        alwaysUseDefaultTargetUrl = application.config.grails.plugin.springsecurity.successHandler.alwaysUseDefault
        targetUrlParameter = application.config.grails.plugin.springsecurity.successHandler.targetUrlParameter
        useReferer = application.config.grails.plugin.springsecurity.successHandler.useReferer
    }
}
