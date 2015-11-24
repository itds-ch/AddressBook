<%@ page import="org.itds.AddressBook.Person" %>



<div class="form-group  ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="person.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="name" maxlength="100" required="" value="${personInstance?.name}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'vorname', 'error')} required">
    <label for="vorname" class="col-sm-2 control-label">
        <g:message code="person.vorname.label" default="Vorname" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="vorname" maxlength="100" required="" value="${personInstance?.vorname}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'alias', 'error')} ">
    <label for="alias" class="col-sm-2 control-label">
        <g:message code="person.alias.label" default="Alias" />
        
    </label>
    <div class="col-sm-10">
        <g:textField name="alias" value="${personInstance?.alias}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'geburtsdatum', 'error')} ">
    <label for="geburtsdatum" class="col-sm-2 control-label">
        <g:message code="person.geburtsdatum.label" default="Geburtsdatum" />
        
    </label>
    <div class="col-sm-10">
        <g:datePicker name="geburtsdatum" precision="day"  value="${personInstance?.geburtsdatum}" default="none" noSelection="['': '']" />

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'notizen', 'error')} ">
    <label for="notizen" class="col-sm-2 control-label">
        <g:message code="person.notizen.label" default="Notizen" />
        
    </label>
    <div class="col-sm-10">
        <g:textArea name="notizen" cols="40" rows="5" maxlength="1500" value="${personInstance?.notizen}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: personInstance, field: 'hauptadresse', 'error')} ">
    <label for="hauptadresse" class="col-sm-2 control-label">
        <g:message code="person.hauptadresse.label" default="Hauptadresse" />
        
    </label>
    <div class="col-sm-10">
        <g:select id="hauptadresse" name="hauptadresse.id" from="${org.itds.AddressBook.Address.list()}" optionKey="id" value="${personInstance?.hauptadresse?.id}" class="many-to-one" noSelection="['null': '']"/>

    </div>
</div>




