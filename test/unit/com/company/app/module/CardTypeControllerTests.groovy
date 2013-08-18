package com.company.app.module



import org.junit.*
import grails.test.mixin.*

@TestFor(CardTypeController)
@Mock(CardType)
class CardTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cardType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cardTypeInstanceList.size() == 0
        assert model.cardTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cardTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cardTypeInstance != null
        assert view == '/cardType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cardType/show/1'
        assert controller.flash.message != null
        assert CardType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cardType/list'

        populateValidParams(params)
        def cardType = new CardType(params)

        assert cardType.save() != null

        params.id = cardType.id

        def model = controller.show()

        assert model.cardTypeInstance == cardType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cardType/list'

        populateValidParams(params)
        def cardType = new CardType(params)

        assert cardType.save() != null

        params.id = cardType.id

        def model = controller.edit()

        assert model.cardTypeInstance == cardType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cardType/list'

        response.reset()

        populateValidParams(params)
        def cardType = new CardType(params)

        assert cardType.save() != null

        // test invalid parameters in update
        params.id = cardType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cardType/edit"
        assert model.cardTypeInstance != null

        cardType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cardType/show/$cardType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cardType.clearErrors()

        populateValidParams(params)
        params.id = cardType.id
        params.version = -1
        controller.update()

        assert view == "/cardType/edit"
        assert model.cardTypeInstance != null
        assert model.cardTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cardType/list'

        response.reset()

        populateValidParams(params)
        def cardType = new CardType(params)

        assert cardType.save() != null
        assert CardType.count() == 1

        params.id = cardType.id

        controller.delete()

        assert CardType.count() == 0
        assert CardType.get(cardType.id) == null
        assert response.redirectedUrl == '/cardType/list'
    }
}
