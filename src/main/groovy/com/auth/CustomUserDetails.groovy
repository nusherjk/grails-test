package com.auth

import grails.plugin.springsecurity.userdetails.GrailsUser
import org.springframework.security.core.GrantedAuthority

class CustomUserDetails extends GrailsUser {

    final String firstname
    final String lastname
    final String phone
    final String address
    final Date dob


    CustomUserDetails(String username, String password, boolean enabled,
                      boolean accountNonExpired, boolean credentialsNonExpired,
                      boolean accountNonLocked,
                      Collection<GrantedAuthority> authorities,
                      long id, String firstname, String lastname, String phone, String address, Date dob) {
        super(username, password, enabled, accountNonExpired,
                credentialsNonExpired, accountNonLocked, authorities, id)

        this.firstname = firstname
        this.lastname = lastname
        this.phone = phone
        this.address = address
        this.dob = dob
    }
}

