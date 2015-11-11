<%=packageName%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
                    <g:link action="show" id="\${${propertyName}?.id}">
                        <i class="fa fa-search"></i>
                        <g:message code="default.button.show.label" default="Show" />
                    </g:link>
                    <g:link action="delete" id="\${${propertyName}?.id}">
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
                        <g:message code="default.edit.label" args="[entityName]" />
                    </a>
                </h4>
            </div>
            <div id="editContent" class="panel-collapse collapse in">
                <div class="panel-body">

                    <g:render template="/includes/flashMessages" />

                    <g:hasErrors bean="\${${propertyName}}">
                        <bootstrap:alert class="alert-danger">
                            <ul>
                                <g:eachError bean="\${${propertyName}}" var="error">
                                    <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
                                </g:eachError>
                            </ul>
                        </bootstrap:alert>
                    </g:hasErrors>

                    <g:form class="form-horizontal" role="form" action="update" method="PUT" id="\${${propertyName}?.id}" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
                        <g:hiddenField name="version" value="\${${propertyName}?.version}" />

                        <g:render template="form" />

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-default"><g:message code="default.button.update.label" /></button>
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
