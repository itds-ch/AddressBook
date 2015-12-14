<%@ page import="org.itds.AddressBook.AddressBook" %>



<div class="form-group  ${hasErrors(bean: addressBookInstance, field: 'benutzer', 'error')} required">
    <label for="benutzer" class="col-sm-2 control-label">
        <g:message code="addressBook.benutzer.label" default="Benutzer" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:select class = "benutzername" id="benutzer" name="benutzer.id" from="${loggedBenutzer}" optionKey="id" required="" value="${addressBookInstance?.benutzer?.id}"/>

    </div>
</div>



<div class="form-group  ${hasErrors(bean: addressBookInstance, field: 'name', 'error')} required">
    <label for="name" class="col-sm-2 control-label">
        <g:message code="addressBook.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <div class="col-sm-10">
        <g:textField name="name" required="" value="${addressBookInstance?.name}"/>

    </div>
</div>




