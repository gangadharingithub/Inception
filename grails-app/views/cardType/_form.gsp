<%@ page import="com.company.app.module.CardType" %>



<div class="fieldcontain ${hasErrors(bean: cardTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="cardType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${cardTypeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cardTypeInstance, field: 'bank', 'error')} required">
	<label for="bank">
		<g:message code="cardType.bank.label" default="Bank" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bank" name="bank.id" from="${com.company.app.module.Bank.list()}" optionKey="id" required="" value="${cardTypeInstance?.bank?.id}" class="many-to-one"/>
</div>

