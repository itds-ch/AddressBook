
<%@ page import="org.itds.AddressBook.Tag" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
    <g:set var="entityNamePlural" value="${message(code: 'tag.plural.label', default: 'Tags')}" />
    <title><g:message code="default.list.label" args="[entityNamePlural]" /></title>
</head>

<body>
<div class="row">

<div class="col-sm-2">
    <div class="dropdown clearfix">
        <ul class="dropdown-menu well" style="display:inline;position:relative;width:100%;z-index:10;">
            <li class="dropdown-header"><g:message code="default.menu.left.title" default="Funktionen" /></li>

            <li >
                <g:link  action="create" id="${tagInstance?.id}">
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
                    
                    <th><g:message code="tag.benutzer.label" default="Benutzer" /></th>
                   
                    <th><g:message code="tag.iconName.label" default="Icon Name" /></th>
                   
                    <th><g:message code="tag.name.label" default="Name" /></th>
                   
                </tr>
                </thead>
                <tbody>
                <g:each in="${tagInstanceList}" status="i" var="tagInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        
                        <td><g:link action="show" id="${tagInstance.id}">${fieldValue(bean: tagInstance, field: "benutzer")}</g:link></td>
                        
                        <td>${fieldValue(bean: tagInstance, field: "iconName")}</td>
                        
                        <td>${fieldValue(bean: tagInstance, field: "name")}</td>
                        
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
