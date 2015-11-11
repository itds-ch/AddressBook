<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
    <g:set var="entityNamePlural" value="\${message(code: '${domainClass.propertyName}.plural.label', default: '${className}s')}" />
    <title><g:message code="default.list.label" args="[entityNamePlural]" /></title>
</head>

<body>
<div class="row">

<div class="col-sm-2">
    <div class="dropdown clearfix">
        <ul class="dropdown-menu well" style="display:inline;position:relative;width:100%;z-index:10;">
            <li class="dropdown-header"><g:message code="default.menu.left.title" default="Funktionen" /></li>

            <li >
                <g:link  action="create" id="\${${propertyName}?.id}">
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
                    <%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
                    allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
                    props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
                    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                    props.eachWithIndex { p, i ->
                        if (i < 6) {
                            %>
                    <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
                   <%   }   } %>
                </tr>
                </thead>
                <tbody>
                <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                    <tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
                        <%  props.eachWithIndex { p, i ->
                            if (i == 0) { %>
                        <td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                        <%      } else if (i < 6) {
                            if (p.type == Boolean || p.type == boolean) { %>
                        <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
                        <%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                        <td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
                        <%          } else { %>
                        <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                        <%  }   }   } %>
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
