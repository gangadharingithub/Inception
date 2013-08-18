<%@ page import="com.company.app.module.Offer" %>


<div class="fieldcontain ${hasErrors(bean: offerInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="offer.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.company.app.module.Category.list()}" optionKey="id" required="" value="${offerInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: offerInstance, field: 'card', 'error')} required">
	<label for="card">
		<g:message code="offer.card.label" default="Card" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="card" name="card.id" from="${com.company.app.module.Card.list()}" optionKey="id" required="" value="${offerInstance?.card?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: offerInstance, field: 'store', 'error')} required">
	<label for="store">
		<g:message code="offer.store.label" default="Store" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="store" name="store.id" from="${com.company.app.module.Store.list()}" optionKey="id" required="" value="${offerInstance?.store?.id}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: offerInstance, field: 'offer', 'error')} required">
	<label for="offer">
		<g:message code="offer.offer.label" default="Offer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="offer" required="" value="${offerInstance?.offer}"/>
</div>


