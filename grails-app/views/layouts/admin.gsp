<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="EducateMart"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <asset:stylesheet src="materialize.css"/>
    <asset:stylesheet src="customrules.css"/>
    <asset:stylesheet src="adminrules.css"/>
    <asset:stylesheet src="icons.css"/>
    <asset:stylesheet src="customicons.css"/>
    <asset:stylesheet src="jquery-ui.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="jquery-ui.js"/>
    <asset:javascript src="materialize.js"/>
<asset:javascript src="readmore.js"/>
    <script>
        $(document).ready(function() {
            $('select').material_select();
            $(".button-collapse").sideNav();
            $('.modal-trigger').leanModal();

        });
    </script>
    <g:layoutHead/>
</head>
<body>
<header>
    <nav class="top-nav green">
        <div class="container">
            <div class="nav-wrapper"><a class="page-title">EducateMart</a>
                <ul class="right hide-on-small-only" style="line-height: 122px">
                    <li><g:link controller='logout' class="btn appcolor">Logout</g:link></li>
                </ul>
            </div>
        </div>
%{--        <div class="container">
            <div class="nav-wrapper"><span id="logo-container" class="brand-logo">EducateMart</span></div>
        </div>--}%
    </nav>
    <div class="container"><a href="#" data-activates="nav-mobile" class="button-collapse top-nav full hide-on-large-only"><i class="mdi-navigation-menu"></i></a></div>
    <ul id="nav-mobile" class="side-nav fixed" style="background-color: darkgrey;">
%{--        <li class="logo"><a id="logo-container" href="/EducateMart" class="brand-logo">
            <g:img dir="images" file="illuminate.png"/>
            </a>
        <li>--}%
        <li style="background-color: darkslategray;">
        <div class="container">
        <a id="logo-container center" href="/EducateMart" style="height: 122px;line-height: 122px"><g:img class="center" dir="images" file="illuminate.png" style="height: 90px; vertical-align: middle;"/></a>
        </div>
    </li>
        <li class="bold">
            <g:link action="showSchools" class="waves-effect waves-green">Manage Schools</g:link>
        </li>
        <li class="bold">
            <g:link action="regForm" class="waves-effect waves-green">School Registration</g:link>
        </li>
%{--
        <li class="no-padding">
--}%
            <ul class="collapsible collapsible-accordion">
                <li class="bold"><a class="collapsible-header waves-effect waves-green">Manage Facilities</a>
                    <div class="collapsible-body" style="display: none;">
                        <ul>
                            <li class="light">
                                <g:link controller="admin" action="manageDefaultFacilities" class="waves-effect waves-green">Common Facilities</g:link>
                            </li>
                            <li class="light">
                                <g:link controller="admin" action="manageCustomFacilities" class="waves-effect waves-green">Additional Facilities</g:link>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </l%{----}%i>
        <li class="bold">
            <g:link action="manageUsers" class="waves-effect waves-green">Manage Users</g:link>
        </li>
%{--        <li class="bold">
            <g:link action="manageReviews" class="waves-effect waves-green">Manage Reviews</g:link>
        </li>--}%
%{--
        <li class="no-padding">
--}%
            <ul class="collapsible collapsible-accordion">
                <li class="bold"><a class="collapsible-header waves-effect waves-green">Manage Reviews</a>
                    <div class="collapsible-body" style="display: none;">
                        <ul>
                            <li class="light">
                                <g:link controller="admin" action="manageUnmoderatedReviews" class="waves-effect waves-green">Un-moderated Reviews</g:link>
                            </li>
                            <li class="light">
                                <g:link controller="admin" action="manageModeratedReviews" class="waves-effect waves-green">Moderated Reviews</g:link>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
%{--
        </li>
--}%


        <div class="center">
        <p style="position: absolute;font-size: .8em;font-weight: bold;color: #444;bottom: 80px;">Copyright Jellyfish Technologies</p>
        </div>
    </ul>
</header>
<g:layoutBody/>

</body>
</html>