<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>
        <g:layoutTitle default="EducateMart"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="materialize.css"/>
    <asset:stylesheet src="icons.css"/>
    <asset:stylesheet src="customrules.css"/>
    <asset:stylesheet src="jquery-ui.css"/>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:javascript src="jquery-ui.js"/>
    <asset:javascript src="materialize.js"/>
    <asset:javascript src="readmore.js"/>

    <script>
    $(document).ready(function() {
        $('select').material_select();
        $('.modal-trigger').leanModal();

    });
    </script>
    <g:layoutHead/>
</head>
<body>

<div class="navbar-fixed" id="navbarfixed">
    <nav class="appcolor" role="navigation">
        <div class="nav-wrapper" style="margin-left: 20px; margin-right: 20px;">
            <a id="logo-container" href="/EducateMart"><g:img dir="images" file="illuminate.png" style="height: 36px; vertical-align: middle; margin-top: -12px;"/><span class="white-text" style="font-size: 1.8rem; margin-left: 10px; font-weight: 300;">EducateMart</span></a>

            <ul class="right hide-on-small-only">
                <li><a href="/EducateMart" class="grey-text text-lighten-3">Home</a></li>
                <li><a href="#" class="grey-text text-lighten-3">Best 10 Schools in</a></li>
                <li><g:link controller='logout' class="btn green">Logout</g:link></li>
            </ul>
        </div>
    </nav>
</div>

    <g:layoutBody/>

<footer class="page-footer appcolor">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">About EducateMart</h5>
                <p class="grey-text text-lighten-4">Finding the best school for your child can be frustrating & overwhelming.<br>EducateMart has been created to help you with this task.</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Useful Resources</h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#!">Nursery Admission Guidelines</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Terms and Conditions</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Contact Us</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Reach Us</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            Copyright 2016 © Jellyfish Technologies
            <div class="social__container">
                <div class="social__item">
                    <a target="_blank" href="#" class="social__icon--twitter"><i class="icon--twitter"></i></a>
                </div>
                <div class="social__item">
                    <a target="_blank" href="#" class="social__icon--facebook"><i class="icon--facebook"></i></a>
                </div>
                <div class="social__item">
                    <a target="_blank" href="#" class="social__icon--linkedin"><i class="icon--linkedin"></i></a>
                </div>
                <div class="social__item">
                    <a target="_blank" href="#" class="social__icon--googleplus"><i class="icon--googleplus"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>




</body>
</html>
