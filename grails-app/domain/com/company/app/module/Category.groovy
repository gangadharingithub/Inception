package com.company.app.module

class Category {
	
	String name
    static constraints = {
		name blank: false, nullable: false
    }
	
	String toString() {
		"${name}"
	}
}
