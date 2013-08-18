<%@ page import="com.company.app.module.Card" %>



<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="card.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${cardInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'bank', 'error')} required">
	<label for="bank">
		<g:message code="card.bank.label" default="Bank" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bank" name="bank.id" from="${com.company.app.module.Bank.list()}" optionKey="id" required="" value="${cardInstance?.bank?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardInstance, field: 'cardType', 'error')} required">
	<label for="cardType">
		<g:message code="card.cardType.label" default="Card Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cardType" name="cardType.id" from="${com.company.app.module.CardType.list()}" optionKey="id" required="" value="${cardInstance?.cardType?.id}" class="many-to-one"/>
</div>

