package com.company.app.module

class Offer {
		
	Category category
	Card card
	Store store	
	String offer

    static constraints = {
		offer blank: false, nullable: false
    }
	
	static mapping = {	
		
		card column:'CARD_ID'
		store column:'STORE_ID'
		category column:'CATEGORY_ID'
	}
		
	String toString() {
		" ${category} ==> ${card} ==> ${store} ==> ${offer}"
	}
}
