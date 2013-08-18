
<%@ page import="com.company.app.module.Offer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'offer.label', default: 'Offer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-offer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-offer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list offer">
			
				<g:if test="${offerInstance?.offer}">
				<li class="fieldcontain">
					<span id="offer-label" class="property-label"><g:message code="offer.offer.label" default="Offer" /></span>
					
						<span class="property-value" aria-labelledby="offer-label"><g:fieldValue bean="${offerInstance}" field="offer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${offerInstance?.card}">
				<li class="fieldcontain">
					<span id="card-label" class="property-label"><g:message code="offer.card.label" default="Card" /></span>
					
						<span class="property-value" aria-labelledby="card-label"><g:link controller="card" action="show" id="${offerInstance?.card?.id}">${offerInstance?.card?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${offerInstance?.category}">
				<li class="fieldcontain">
					<span id="category-label" class="property-label"><g:message code="offer.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${offerInstance?.category?.id}">${offerInstance?.category?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${offerInstance?.store}">
				<li class="fieldcontain">
					<span id="store-label" class="property-label"><g:message code="offer.store.label" default="Store" /></span>
					
						<span class="property-value" aria-labelledby="store-label"><g:link controller="store" action="show" id="${offerInstance?.store?.id}">${offerInstance?.store?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${offerInstance?.id}" />
					<g:link class="edit" action="edit" id="${offerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
