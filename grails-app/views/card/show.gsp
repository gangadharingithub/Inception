
<%@ page import="com.company.app.module.Card" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'card.label', default: 'Card')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-card" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-card" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list card">
			
				<g:if test="${cardInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="card.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cardInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.bank}">
				<li class="fieldcontain">
					<span id="bank-label" class="property-label"><g:message code="card.bank.label" default="Bank" /></span>
					
						<span class="property-value" aria-labelledby="bank-label"><g:link controller="bank" action="show" id="${cardInstance?.bank?.id}">${cardInstance?.bank?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cardInstance?.cardType}">
				<li class="fieldcontain">
					<span id="cardType-label" class="property-label"><g:message code="card.cardType.label" default="Card Type" /></span>
					
						<span class="property-value" aria-labelledby="cardType-label"><g:link controller="cardType" action="show" id="${cardInstance?.cardType?.id}">${cardInstance?.cardType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cardInstance?.id}" />
					<g:link class="edit" action="edit" id="${cardInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
