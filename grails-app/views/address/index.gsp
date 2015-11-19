
<%@ page import="org.itds.AddressBook.Address" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
    <g:set var="entityNamePlural" value="${message(code: 'address.plural.label', default: 'Addresss')}" />
    <title><g:message code="default.list.label" args="[entityNamePlural]" /></title>
</head>

<body>
<div class="row">

<div class="col-sm-2">
    <div class="dropdown clearfix">
        <ul class="dropdown-menu well" style="display:inline;position:relative;width:100%;z-index:10;">
            <li class="dropdown-header"><g:message code="default.menu.left.title" default="Funktionen" /></li>

            <li >
                <g:link  action="create" id="${addressInstance?.id}">
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
                    
                    <th><g:message code="address.bezeichnung.label" default="Bezeichnung" /></th>
                   
                    <th><g:message code="address.firma.label" default="Firma" /></th>
                   
                    <th><g:message code="address.strasse.label" default="Strasse" /></th>
                   
                    <th><g:message code="address.plz.label" default="Plz" /></th>
                   
                    <th><g:message code="address.ort.label" default="Ort" /></th>
                   
                    <th><g:message code="address.personalEmail.label" default="Personal Email" /></th>
                   
                </tr>
                </thead>
                <tbody>
                <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
                        <td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "bezeichnung")}</g:link></td>
                        
                        <td>${fieldValue(bean: addressInstance, field: "firma")}</td>
                        
                        <td>${fieldValue(bean: addressInstance, field: "strasse")}</td>
                        
                        <td>${fieldValue(bean: addressInstance, field: "plz")}</td>
                        
                        <td>${fieldValue(bean: addressInstance, field: "ort")}</td>
                        
                        <td>${fieldValue(bean: addressInstance, field: "personalEmail")}</td>
                        
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
