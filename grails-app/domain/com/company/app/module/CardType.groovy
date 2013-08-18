package com.company.app.module

class CardType {
	
	String name
	Bank bank
    static constraints = {		
		name blank: false, nullable: false
    }
	
	static mapping = {		
		bank column:'BANK_ID'		
	}
	
	String toString() {
	     "${name}"
	}
}
