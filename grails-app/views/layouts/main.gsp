<%@ page import="socialPlugins.User" %>
<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="bootstrap.js" />
    <asset:stylesheet src="bootstrap.css" />
    <g:layoutHead/>
</head>
<body>
    <g:layoutBody/>

    <div class="footer" role="contentinfo">
         <spans>Developed By Ketan Pandey | Jelly Fish Technologies | Noida</spans>
    </div>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>