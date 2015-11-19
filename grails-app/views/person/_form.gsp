<%@ page import="org.itds.AddressBook.Person" %>



<div class="form-group  ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="person.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="name" required="" value="${personInstance?.name}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'vorname', 'error')} required">
    <label for="vorname" class="col-sm-2 control-label">
        <g:message code="person.vorname.label" default="Vorname" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="vorname" required="" value="${personInstance?.vorname}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'alias', 'error')} required">
    <label for="alias" class="col-sm-2 control-label">
        <g:message code="person.alias.label" default="Alias" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="alias" required="" value="${personInstance?.alias}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'geburtsdatum', 'error')} required">
    <label for="geburtsdatum" class="col-sm-2 control-label">
        <g:message code="person.geburtsdatum.label" default="Geburtsdatum" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:datePicker name="geburtsdatum" precision="day"  value="${personInstance?.geburtsdatum}"  />

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'notizen', 'error')} required">
    <label for="notizen" class="col-sm-2 control-label">
        <g:message code="person.notizen.label" default="Notizen" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="notizen" required="" value="${personInstance?.notizen}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'hauptadresse', 'error')} required">
    <label for="hauptadresse" class="col-sm-2 control-label">
        <g:message code="person.hauptadresse.label" default="Hauptadresse" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:select id="hauptadresse" name="hauptadresse.id" from="${org.itds.AddressBook.Address.list()}" optionKey="id" required="" value="${personInstance?.hauptadresse?.id}" class="many-to-one"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'adressbuch', 'error')} required">
    <label for="adressbuch" class="col-sm-2 control-label">
        <g:message code="person.adressbuch.label" default="Adressbuch" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:select id="adressbuch" name="adressbuch.id" from="${org.itds.AddressBook.AddressBook.list()}" optionKey="id" required="" value="${personInstance?.adressbuch?.id}" class="many-to-one"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'tags', 'error')} ">
    <label for="tags" class="col-sm-2 control-label">
        <g:message code="person.tags.label" default="Tags" />
        
    </label>
    <div class="col-sm-10">
        <g:select name="tags" from="${org.itds.AddressBook.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${personInstance?.tags*.id}" class="many-to-many"/>

    </div>
</div>




