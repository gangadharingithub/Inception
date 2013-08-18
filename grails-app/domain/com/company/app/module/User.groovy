package com.company.app.module

class User {
	
	String userName
	String firstName
	String lastName
	String email

    static constraints = {
		firstName blank: false, nullable: false
		lastName blank: false, nullable: false
		userName blank: false, nullable: false
		email blank: false,email: true
    }
}
