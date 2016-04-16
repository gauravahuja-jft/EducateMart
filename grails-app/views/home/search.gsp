<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 3/3/16
  Time: 2:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>EducateMart</title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
</head>

<body>
<main class="grey lighten-3">
<div class="section">
    <div class="container">
        <div class="card-panel">
        <ul class="collection">
            <g:each in="${schools}">
            <li class="collection-item avatar">
                <i class="material-icons circle">school</i>
                <span class="title">${it.name}</span>
                <p> Board : ${it.board.name}<br>
                    State : ${it.state.name}<br>
                    Fee : ${it.fee}<br>
                    <g:link controller="schoolDetail" action="index" params="[schoolId:it.id]">More</g:link>
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">compare</i></a>
            </li>
            </g:each>
        </ul>
        </div>
    </div>
</div>
</main>
</body>
</html>