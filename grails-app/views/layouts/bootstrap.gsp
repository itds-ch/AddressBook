<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="addressbook.less"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>
<body role="document">

<!-- Fixed navbar -->
<div class="navbar navbar-inverse" role="navigation">
    <div class="navbar-inner container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${raw(g.createLinkTo(uri:'/'))}"><g:meta name="app.name"/></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">

                <li><g:link controller="addressBook" action="index">
                    <g:message code="addressBook.plural.label" /></g:link></li>
                <li><g:link controller="address" action="index">
                    <g:message code="address.plural.label" /></g:link></li>
                <li><g:link controller="person" action="index">
                    <g:message code="person.plural.label" /></g:link></li>
                <li><g:link controller="tag" action="index">
                    <g:message code="tag.plural.label" /></g:link></li>

            </ul>
            <ul class="nav navbar-nav pull-right">
                <li id="itds_connect">
                </li>
                <jq:jquery>
                    itds_connect_register('#itds_connect');
                </jq:jquery>

                <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-user"></i> ${request.user} <b class="caret"></b>

                </a>
                    <ul class="dropdown-menu">

                        <li><g:link controller="auth" action="login"><g:message code="login.label"/></g:link></li>
                        <li><g:link controller="auth" action="logout"><g:message code="logout.label"/></g:link></li>
                    </ul>

                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>

<div class="container-fluid" role="main">
    <br /><br />

    <g:layoutBody/>


</div> <!-- /container -->


<footer class="footer">

    <g:meta name="app.name"/>
    <g:meta name="app.version"/> @ <%=  new Date() %> on <%= InetAddress.getLocalHost().getHostName() %>



</footer>

</body>
</html>
