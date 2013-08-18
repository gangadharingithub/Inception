package com.company.app.module

import org.springframework.dao.DataIntegrityViolationException

class OfferController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [offerInstanceList: Offer.list(params), offerInstanceTotal: Offer.count()]
    }

    def create() {
        [offerInstance: new Offer(params)]
    }

    def save() {
        def offerInstance = new Offer(params)
        if (!offerInstance.save(flush: true)) {
            render(view: "create", model: [offerInstance: offerInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'offer.label', default: 'Offer'), offerInstance.id])
        redirect(action: "show", id: offerInstance.id)
    }

    def show(Long id) {
        def offerInstance = Offer.get(id)
        if (!offerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), id])
            redirect(action: "list")
            return
        }

        [offerInstance: offerInstance]
    }

    def edit(Long id) {
        def offerInstance = Offer.get(id)
        if (!offerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), id])
            redirect(action: "list")
            return
        }

        [offerInstance: offerInstance]
    }

    def update(Long id, Long version) {
        def offerInstance = Offer.get(id)
        if (!offerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (offerInstance.version > version) {
                offerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'offer.label', default: 'Offer')] as Object[],
                          "Another user has updated this Offer while you were editing")
                render(view: "edit", model: [offerInstance: offerInstance])
                return
            }
        }

        offerInstance.properties = params

        if (!offerInstance.save(flush: true)) {
            render(view: "edit", model: [offerInstance: offerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'offer.label', default: 'Offer'), offerInstance.id])
        redirect(action: "show", id: offerInstance.id)
    }

    def delete(Long id) {
        def offerInstance = Offer.get(id)
        if (!offerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'offer.label', default: 'Offer'), id])
            redirect(action: "list")
            return
        }

        try {
            offerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'offer.label', default: 'Offer'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'offer.label', default: 'Offer'), id])
            redirect(action: "show", id: id)
        }
    }
}
