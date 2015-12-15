
<%@ page import="org.itds.AddressBook.Person" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">

    <div class="col-sm-2">
        <div class="dropdown clearfix">
            <ul class="dropdown-menu well" style="display:inline;position:relative;width:100%;z-index:10;">
                <li class="dropdown-header"><g:message code="default.menu.left.title" default="Funktionen" /></li>

                <li >
                    <g:link action="index">
                        <i class="fa fa-list"></i>
                        <g:message code="default.button.list.label" default="List" />
                    </g:link>
                    <g:link action="create">
                        <i class="fa fa-plus"></i>
                        <g:message code="default.button.create.label" default="Create" />
                    </g:link>
                    <g:link action="edit" id="${personInstance?.id}">
                        <i class="fa fa-pencil"></i>
                        <g:message code="default.button.edit.label" default="Create" />
                    </g:link>
                    <g:link action="delete" id="${personInstance?.id}">
                        <i class="fa fa-trash-o"></i>
                        <g:message code="default.button.delete.label" default="Delete" />
                    </g:link>
                </li>

            </ul>
        </div>
    </div>

    <div class="col-sm-10">


        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#filter" href="#listContent">
                        <g:message code="default.show.label" args="[entityName]" />
                    </a>
                </h4>
            </div>
            <div id="editContent" class="panel-collapse collapse in">
                <div class="panel-body">

                <g:render template="/includes/flashMessages" />

				<dl class="dl-horizontal">
				
					<g:if test="${personInstance?.adressbuch}">
						<dt><g:message code="person.adressbuch.label" default="Adressbuch" /></dt>
						
							<dd><g:link controller="addressBook" action="show" id="${personInstance?.adressbuch?.id}">${personInstance?.adressbuch?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
					<g:if test="${personInstance?.name}">
						<dt><g:message code="person.name.label" default="Name" /></dt>
						
							<dd><g:fieldValue bean="${personInstance}" field="name"/></dd>
						
					</g:if>
				
					<g:if test="${personInstance?.vorname}">
						<dt><g:message code="person.vorname.label" default="Vorname" /></dt>
						
							<dd><g:fieldValue bean="${personInstance}" field="vorname"/></dd>
						
					</g:if>
				
					<g:if test="${personInstance?.alias}">
						<dt><g:message code="person.alias.label" default="Alias" /></dt>
						
							<dd><g:fieldValue bean="${personInstance}" field="alias"/></dd>
						
					</g:if>
				
					<g:if test="${personInstance?.geburtsdatum}">
						<dt><g:message code="person.geburtsdatum.label" default="Geburtsdatum" /></dt>
						
							<dd><g:formatDate date="${personInstance?.geburtsdatum}" /></dd>
						
					</g:if>
				
					<g:if test="${personInstance?.notizen}">
						<dt><g:message code="person.notizen.label" default="Notizen" /></dt>
						
							<dd><g:fieldValue bean="${personInstance}" field="notizen"/></dd>
						
					</g:if>
				
					<g:if test="${personInstance?.hauptadresse}">
						<dt><g:message code="person.hauptadresse.label" default="Hauptadresse" /></dt>
						
							<dd><g:link controller="address" action="show" id="${personInstance?.hauptadresse?.id}">${personInstance?.hauptadresse?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
					
					<g:if test="${personInstance?.tags}">
						<dt><g:message code="person.tags.label" default="Tags" /></dt>
						
							<dd><g:fieldValue bean="${personInstance}" field="tags"/></dd>
						
					</g:if>
				
				</dl>

                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>
