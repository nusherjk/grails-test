package com.auth

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.web.mapping.LinkGenerator
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse


class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
    LinkGenerator linkGenerator
    private static final ADMIN_ROLE = 'ROLE_ADMIN'


    @Override
    protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
        if(SpringSecurityUtils.ifAllGranted(ADMIN_ROLE)) {
            return linkGenerator.link(controller: 'admin', action: "index")
        }

        return super.determineTargetUrl(request, response);
    }

}