
<%@ page import="org.itds.AddressBook.Benutzer" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'benutzer.label', default: 'Benutzer')}" />
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
                    <g:link action="edit" id="${benutzerInstance?.id}">
                        <i class="fa fa-pencil"></i>
                        <g:message code="default.button.edit.label" default="Create" />
                    </g:link>
                    <g:link action="delete" id="${benutzerInstance?.id}">
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
				
					<g:if test="${benutzerInstance?.benutzername}">
						<dt><g:message code="benutzer.benutzername.label" default="Benutzername" /></dt>
						
							<dd><g:fieldValue bean="${benutzerInstance}" field="benutzername"/></dd>
						
					</g:if>
				
					<g:if test="${benutzerInstance?.passwort}">
						<dt><g:message code="benutzer.passwort.label" default="Passwort" /></dt>
						
							<dd><g:fieldValue bean="${benutzerInstance}" field="passwort"/></dd>
						
					</g:if>
				
				</dl>

                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>
