package com.company.app.module

class Store {
	
	String name
	String address1
	String address2
	String address3

    static constraints = {
		name blank: false, nullable: false
		address1 blank: false, nullable: false
    }
	
	String toString() {
		"${name}"
	}
}
