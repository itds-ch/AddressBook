<%@ page import="org.itds.AddressBook.Benutzer" %>



<div class="form-group  ${hasErrors(bean: benutzerInstance, field: 'benutzername', 'error')} required">
    <label for="benutzername" class="col-sm-2 control-label">
        <g:message code="benutzer.benutzername.label" default="Benutzername" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="benutzername" maxlength="100" required="" value="${benutzerInstance?.benutzername}"/>

    </div>
</div>

<div class="form-group  ${hasErrors(bean: benutzerInstance, field: 'passwort', 'error')} required">
    <label for="passwort" class="col-sm-2 control-label">
        <g:message code="benutzer.passwort.label" default="Passwort" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="passwort" maxlength="100" required="" value=""/>

    </div>
</div>




