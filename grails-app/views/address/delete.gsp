<%@ page import="org.itds.AddressBook.Address" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
    <title><g:message code="default.delete.label" args="[entityName]" /></title>
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
                    <g:link action="show" id="${addressInstance?.id}">
                        <i class="fa fa-search"></i>
                        <g:message code="default.button.show.label" default="Show" />
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
                        <g:message code="default.delete.label" args="[entityName]" />
                    </a>
                </h4>
            </div>
            <div id="editContent" class="panel-collapse collapse in">
                <div class="panel-body">

                    <g:render template="/includes/flashMessages" />


                    <g:form class="form-horizontal" role="form" action="delete" method="DELETE" id="${addressInstance?.id}">
                        <g:hiddenField name="version" value="${addressInstance?.version}" />


                        <div class="alert alert-danger" role="alert"><g:message code="default.delete.question" args="[addressInstance]" /></div>


                        <div class="form-group">
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-danger"><g:message code="default.button.delete.label" /></button>
                                <g:link action="show" id="${addressInstance?.id}" class="btn btn-default"><g:message code="default.button.cancel.label" /></g:link>
                            </div>
                        </div>

                    </g:form>

                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>
