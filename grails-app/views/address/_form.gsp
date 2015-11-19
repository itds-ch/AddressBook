<%@ page import="org.itds.AddressBook.Address" %>



<div class="form-group  ${hasErrors(bean: addressInstance, field: 'bezeichnung', 'error')} required">
    <label for="bezeichnung" class="col-sm-2 control-label">
        <g:message code="address.bezeichnung.label" default="Bezeichnung" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="bezeichnung" required="" value="${addressInstance?.bezeichnung}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'firma', 'error')} required">
    <label for="firma" class="col-sm-2 control-label">
        <g:message code="address.firma.label" default="Firma" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="firma" required="" value="${addressInstance?.firma}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'strasse', 'error')} required">
    <label for="strasse" class="col-sm-2 control-label">
        <g:message code="address.strasse.label" default="Strasse" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="strasse" required="" value="${addressInstance?.strasse}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'plz', 'error')} ">
    <label for="plz" class="col-sm-2 control-label">
        <g:message code="address.plz.label" default="Plz" />
        
    </label>
    <div class="col-sm-10">
        <g:field name="plz" type="number" value="${addressInstance.plz}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'ort', 'error')} required">
    <label for="ort" class="col-sm-2 control-label">
        <g:message code="address.ort.label" default="Ort" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="ort" required="" value="${addressInstance?.ort}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'personalEmail', 'error')} required">
    <label for="personalEmail" class="col-sm-2 control-label">
        <g:message code="address.personalEmail.label" default="Personal Email" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:field type="email" name="personalEmail" required="" value="${addressInstance?.personalEmail}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'tel', 'error')} required">
    <label for="tel" class="col-sm-2 control-label">
        <g:message code="address.tel.label" default="Tel" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="tel" required="" value="${addressInstance?.tel}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'mobile', 'error')} required">
    <label for="mobile" class="col-sm-2 control-label">
        <g:message code="address.mobile.label" default="Mobile" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="mobile" required="" value="${addressInstance?.mobile}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'website', 'error')} required">
    <label for="website" class="col-sm-2 control-label">
        <g:message code="address.website.label" default="Website" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:field type="url" name="website" required="" value="${addressInstance?.website}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: addressInstance, field: 'person', 'error')} required">
    <label for="person" class="col-sm-2 control-label">
        <g:message code="address.person.label" default="Person" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:select id="person" name="person.id" from="${org.itds.AddressBook.Person.list()}" optionKey="id" required="" value="${addressInstance?.person?.id}" class="many-to-one"/>

    </div>
</div>




