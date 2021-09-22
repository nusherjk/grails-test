<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Test"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>
<sec:ifLoggedIn>
<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    <a class="navbar-brand" href="/#"><asset:image src="grails.svg" alt="Grails Logo"/></a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>




    <div class="collapse navbar-collapse" aria-expanded="false" style="height: 0.8px;" id="navbarContent">

        <ul class="nav navbar-nav ml-auto">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <sec:username/>
                </button>
                <div class="dropdown-menu navbar-dark color-light" aria-labelledby="dropdownMenuButton">

                    <g:link class="dropdown-item navbar-light color-light" controller="admin" ><sec:username/></g:link>
                    <g:form class="dropdown-item navbar-light color-light" controller="logout">
                        <g:submitButton class="dropdown-item" name="Submit" value="Logout"  />
                    </g:form>

                </div>
            </div>
        </ul>

    </div>





</nav>

</sec:ifLoggedIn>
    <g:layoutBody/>




<div class="footer row" role="contentinfo">
    <div class="blockquote-footer centered" style="margin: 20px auto; color: white; font-size: 12px;"> Grails test | Contact
        <a href="mailto:nusher.kazi@northsouth.edu">Nusher Jamil Kazi</a>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
