package com.company.app.module

class Bank {
	
	String name
	String url
	String address1
	String address2
	String address3

    static constraints = {
		name blank: false, nullable: false
		address1 blank: false, nullable: false		
		url blank: false,url: true
    }
	
	String toString() {
		"${name}"
	}
}
