<html>
<head>
    <title><g:message code="springSecurity.login.title"/></title>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <asset:stylesheet src="auth.css"/>
    <asset:javascript src="auth.js"/>
</head>

<body>
<div class="materialContainer">

    <div class="box">

        <div class="title">Log in to EducateMart</div>
        <form action='${postUrl}' method='POST' id='loginForm' class='login-form' autocomplete='off'>
        <div class="input">
            <label for='username' class="center-align">Email Id</label>
            <input type='email' name='j_username' id='username'/>
            <span class="spin"></span>
        </div>

        <div class="input">
            <label for='password'>Password</label>
            <input type='password' name='j_password' id='password'/>
            <span class="spin"></span>
        </div>

%{--            <div class="input">
                <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'>Remember me</label>
            </div>--}%
        <div class="button login">
            <button type="submit"><span>LOGIN</span> <i class="fa fa-check"></i></button>
        </div>

        <a href="" class="pass-forgot">Forgot your password?</a>
        </form>
    </div>

    <div class="overbox">
        <div class="material-button alt-2"><span class="shape"></span></div>

        <div class="title">REGISTER</div>
        <g:form action="registerUser" method='POST' id='registerForm' class='login-form' autocomplete='off'>

        <div class="input">
            <label for="regname">Name</label>
            <input type="text" name="name" id="regname">
            <span class="spin"></span>
        </div>
            <div class="input">
                <label for="regemail">Email</label>
                <input type="email" name="email" id="regemail">
                <span class="spin"></span>
            </div>
            <div class="input">
                <label for="regusername">Username</label>
                <input type="text" name="username" id="regusername">
                <span class="spin"></span>
            </div>
        <div class="input">
            <label for="regpass">Password</label>
            <input type="password" name="password" id="regpass">
            <span class="spin"></span>
        </div>

%{--        <div class="input">
            <label for="reregpass">Repeat Password</label>
            <input type="password" name="reregpass" id="reregpass">
            <span class="spin"></span>
        </div>--}%

        <div class="button">
            <button><span>NEXT</span></button>
        </div>
            </g:form>
    </div>

</div>
</body>
</html>
