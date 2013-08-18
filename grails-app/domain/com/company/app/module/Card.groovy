package com.company.app.module

class Card {
	
	String name
	CardType cardType
	Bank bank

    static constraints = {
		name blank: false, nullable: false
    }
		
	static mapping = {		
		bank column:'BANK_ID'
		cardType column:'CARD_TYPE_ID'			
	}
	
	String toString() {
		"${name}"
	}
}
