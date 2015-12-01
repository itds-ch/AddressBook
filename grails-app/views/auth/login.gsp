<%@ page import="org.itds.AddressBook.Benutzer" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'benutzer.label', default: 'Benutzer')}" />
		<title><g:message code="default.login.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="row">

        
        <div class="col-sm-10">


            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#filter" href="#listContent">
                            <g:message code="default.login.label" args="[entityName]" />
                        </a>
                    </h4>
                </div>
                <div id="editContent" class="panel-collapse collapse in">
                    <div class="panel-body">

                        <g:render template="/includes/flashMessages" />

                        <g:hasErrors bean="${benutzerInstance}">
                        <bootstrap:alert class="alert-danger">
                        <ul>
                            <g:eachError bean="${benutzerInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </g:eachError>
                        </ul>
                        </bootstrap:alert>
                        </g:hasErrors>

                        <g:form class="form-horizontal" role="form" action="authenticate" method="POST">
						 
                           <g:render template="form" />

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default"><g:message code="default.button.login.label" /></button>
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