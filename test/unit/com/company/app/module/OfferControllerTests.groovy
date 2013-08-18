package com.company.app.module



import org.junit.*
import grails.test.mixin.*

@TestFor(OfferController)
@Mock(Offer)
class OfferControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/offer/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.offerInstanceList.size() == 0
        assert model.offerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.offerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.offerInstance != null
        assert view == '/offer/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/offer/show/1'
        assert controller.flash.message != null
        assert Offer.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/offer/list'

        populateValidParams(params)
        def offer = new Offer(params)

        assert offer.save() != null

        params.id = offer.id

        def model = controller.show()

        assert model.offerInstance == offer
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/offer/list'

        populateValidParams(params)
        def offer = new Offer(params)

        assert offer.save() != null

        params.id = offer.id

        def model = controller.edit()

        assert model.offerInstance == offer
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/offer/list'

        response.reset()

        populateValidParams(params)
        def offer = new Offer(params)

        assert offer.save() != null

        // test invalid parameters in update
        params.id = offer.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/offer/edit"
        assert model.offerInstance != null

        offer.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/offer/show/$offer.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        offer.clearErrors()

        populateValidParams(params)
        params.id = offer.id
        params.version = -1
        controller.update()

        assert view == "/offer/edit"
        assert model.offerInstance != null
        assert model.offerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/offer/list'

        response.reset()

        populateValidParams(params)
        def offer = new Offer(params)

        assert offer.save() != null
        assert Offer.count() == 1

        params.id = offer.id

        controller.delete()

        assert Offer.count() == 0
        assert Offer.get(offer.id) == null
        assert response.redirectedUrl == '/offer/list'
    }
}
