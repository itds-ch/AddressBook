<%@ page import="org.itds.AddressBook.Tag" %>



<div class="form-group  ${hasErrors(bean: tagInstance, field: 'benutzer', 'error')} required">
    <label for="benutzer" class="col-sm-2 control-label">
        <g:message code="tag.benutzer.label" default="Benutzer" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:select id="benutzer" name="benutzer.id" from="${org.itds.AddressBook.Benutzer.list()}" optionKey="id" required="" value="${tagInstance?.benutzer?.id}" class="many-to-one"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: tagInstance, field: 'iconName', 'error')} required">
    <label for="iconName" class="col-sm-2 control-label">
        <g:message code="tag.iconName.label" default="Icon Name" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="iconName" required="" value="${tagInstance?.iconName}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: tagInstance, field: 'name', 'error')} required">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="tag.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="name" required="" value="${tagInstance?.name}"/>

    </div>
</div>




