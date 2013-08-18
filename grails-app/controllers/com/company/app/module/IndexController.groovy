package com.company.app.module

class IndexController {   

    def index() {
       [offerInstanceList: Offer.findAll()] 
    }

   
}
