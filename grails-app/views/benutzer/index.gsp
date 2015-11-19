
<%@ page import="org.itds.AddressBook.Benutzer" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <g:set var="entityName" value="${message(code: 'benutzer.label', default: 'Benutzer')}" />
    <g:set var="entityNamePlural" value="${message(code: 'benutzer.plural.label', default: 'Benutzers')}" />
    <title><g:message code="default.list.label" args="[entityNamePlural]" /></title>
</head>

<body>
<div class="row">

<div class="col-sm-2">
    <div class="dropdown clearfix">
        <ul class="dropdown-menu well" style="display:inline;position:relative;width:100%;z-index:10;">
            <li class="dropdown-header"><g:message code="default.menu.left.title" default="Funktionen" /></li>

            <li >
                <g:link  action="create" id="${benutzerInstance?.id}">
                    <i class="fa fa-plus"></i>
                    <g:message code="default.button.create.label" default="Edit" />
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
                <g:message code="default.list.label" args="[entityNamePlural]" />
            </a>
        </h4>
    </div>
    <div id="listContent" class="panel-collapse collapse in">
        <div class="panel-body">

            <g:render template="/includes/flashMessages" />

            <table class="table table-striped">
                <thead>
                <tr>
                    
                    <th><g:message code="benutzer.benutzername.label" default="Benutzername" /></th>
                   
                    <th><g:message code="benutzer.passwort.label" default="Passwort" /></th>
                   
                </tr>
                </thead>
                <tbody>
                <g:each in="${benutzerInstanceList}" status="i" var="benutzerInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
                        <td><g:link action="show" id="${benutzerInstance.id}">${fieldValue(bean: benutzerInstance, field: "benutzername")}</g:link></td>
                        
                        <td>${fieldValue(bean: benutzerInstance, field: "passwort")}</td>
                        
                    </tr>
                </g:each>
                </tbody>
            </table>


        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
