<%@ page import="com.company.app.module.Store" %>



<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="store.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${storeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'address1', 'error')} required">
	<label for="address1">
		<g:message code="store.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address1" required="" value="${storeInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="store.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${storeInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: storeInstance, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="store.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${storeInstance?.address3}"/>
</div>

