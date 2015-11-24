
<%@ page import="org.itds.AddressBook.Address" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
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
                    <g:link action="edit" id="${addressInstance?.id}">
                        <i class="fa fa-pencil"></i>
                        <g:message code="default.button.edit.label" default="Create" />
                    </g:link>
                    <g:link action="delete" id="${addressInstance?.id}">
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
				
					<g:if test="${addressInstance?.adresstyp}">
						<dt><g:message code="address.adresstyp.label" default="Adresstyp" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="adresstyp"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.bezeichnung}">
						<dt><g:message code="address.bezeichnung.label" default="Bezeichnung" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="bezeichnung"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.firma}">
						<dt><g:message code="address.firma.label" default="Firma" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="firma"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.strasse}">
						<dt><g:message code="address.strasse.label" default="Strasse" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="strasse"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.plz}">
						<dt><g:message code="address.plz.label" default="Plz" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="plz"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.ort}">
						<dt><g:message code="address.ort.label" default="Ort" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="ort"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.personalEmail}">
						<dt><g:message code="address.personalEmail.label" default="Personal Email" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="personalEmail"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.tel}">
						<dt><g:message code="address.tel.label" default="Tel" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="tel"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.mobile}">
						<dt><g:message code="address.mobile.label" default="Mobile" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="mobile"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.website}">
						<dt><g:message code="address.website.label" default="Website" /></dt>
						
							<dd><g:fieldValue bean="${addressInstance}" field="website"/></dd>
						
					</g:if>
				
					<g:if test="${addressInstance?.person}">
						<dt><g:message code="address.person.label" default="Person" /></dt>
						
							<dd><g:link controller="person" action="show" id="${addressInstance?.person?.id}">${addressInstance?.person?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>
