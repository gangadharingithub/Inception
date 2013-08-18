<%@ page import="com.company.app.module.Item" %>



<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'brand', 'error')} ">
	<label for="brand">
		<g:message code="item.brand.label" default="Brand" />
		
	</label>
	<g:textField name="brand" value="${itemInstance?.brand}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="item.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${com.company.app.module.Category.list()}" optionKey="id" required="" value="${itemInstance?.category?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: itemInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="item.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${itemInstance?.name}"/>
</div>

