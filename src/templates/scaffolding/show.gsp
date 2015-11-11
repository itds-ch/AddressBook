<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="bootstrap">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
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
                    <g:link action="edit" id="\${${propertyName}?.id}">
                        <i class="fa fa-pencil"></i>
                        <g:message code="default.button.edit.label" default="Create" />
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
                        <g:message code="default.show.label" args="[entityName]" />
                    </a>
                </h4>
            </div>
            <div id="editContent" class="panel-collapse collapse in">
                <div class="panel-body">

                <g:render template="/includes/flashMessages" />

				<dl class="dl-horizontal">
				<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
					allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
					props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
					Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					props.each { p -> %>
					<g:if test="\${${propertyName}?.${p.name}}">
						<dt><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
						<%  if (p.isEnum()) { %>
							<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
						<%  } else if (p.oneToMany || p.manyToMany) { %>
							<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
							<dd><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></dd>
							</g:each>
						<%  } else if (p.manyToOne || p.oneToOne) { %>
							<dd><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></dd>
						<%  } else if (p.type == Boolean || p.type == boolean) { %>
							<dd><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></dd>
						<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<dd><g:formatDate date="\${${propertyName}?.${p.name}}" /></dd>
						<%  } else if(!p.type.isArray()) { %>
							<dd><g:fieldValue bean="\${${propertyName}}" field="${p.name}"/></dd>
						<%  } %>
					</g:if>
				<%  } %>
				</dl>

                </div>
            </div>
        </div>

    </div>

</div>
</body>
</html>
