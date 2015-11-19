
<%@ page import="org.itds.AddressBook.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
    <g:set var="entityNamePlural" value="${message(code: 'person.plural.label', default: 'Persons')}" />
    <title><g:message code="default.list.label" args="[entityNamePlural]" /></title>
</head>

<body>
<div class="row">

<div class="col-sm-2">
    <div class="dropdown clearfix">
        <ul class="dropdown-menu well" style="display:inline;position:relative;width:100%;z-index:10;">
            <li class="dropdown-header"><g:message code="default.menu.left.title" default="Funktionen" /></li>

            <li >
                <g:link  action="create" id="${personInstance?.id}">
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
                    
                    <th><g:message code="person.name.label" default="Name" /></th>
                   
                    <th><g:message code="person.vorname.label" default="Vorname" /></th>
                   
                    <th><g:message code="person.alias.label" default="Alias" /></th>
                   
                    <th><g:message code="person.geburtsdatum.label" default="Geburtsdatum" /></th>
                   
                    <th><g:message code="person.notizen.label" default="Notizen" /></th>
                   
                    <th><g:message code="person.hauptadresse.label" default="Hauptadresse" /></th>
                   
                </tr>
                </thead>
                <tbody>
                <g:each in="${personInstanceList}" status="i" var="personInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
                        <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "name")}</g:link></td>
                        
                        <td>${fieldValue(bean: personInstance, field: "vorname")}</td>
                        
                        <td>${fieldValue(bean: personInstance, field: "alias")}</td>
                        
                        <td><g:formatDate date="${personInstance.geburtsdatum}" /></td>
                        
                        <td>${fieldValue(bean: personInstance, field: "notizen")}</td>
                        
                        <td>${fieldValue(bean: personInstance, field: "hauptadresse")}</td>
                        
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
