<%@ page import="com.company.app.module.Bank" %>



<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bank.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${bankInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'address1', 'error')} required">
	<label for="address1">
		<g:message code="bank.address1.label" default="Address1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address1" required="" value="${bankInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="bank.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="url" name="url" required="" value="${bankInstance?.url}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="bank.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" value="${bankInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bankInstance, field: 'address3', 'error')} ">
	<label for="address3">
		<g:message code="bank.address3.label" default="Address3" />
		
	</label>
	<g:textField name="address3" value="${bankInstance?.address3}"/>
</div>

