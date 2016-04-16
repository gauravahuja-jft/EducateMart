<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 25/3/16
  Time: 8:28 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" context="admin"/>
    <title>EducateMart Admin</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
</head>

<body>
<g:if test="${flash.message}">
    <script>
    Materialize.toast('${flash.message}', 4000)
    </script>
</g:if>
<div class="section">
    <div class="container" style="min-width: 80%">
        <div class="card-panel" style="background-color: #ffffff">
            <h5 class="green-text center">Registration Complete</h5>
            <h4 class="black-text center">${school.schoolName}</h4><br>
            <p>Address             :${school.contact.address?.addLine1}, ${school.contact.address?.area}</p>
            <p>State               :${school.contact.address.state?.name}</p>
            <p>City                :${school.contact.address.city?.name}</p>
            <p>Zip Code            :${school.contact.address?.zipCode}</p>

            <g:link action="viewSchool" params="[schoolId:school.id]">View Complete Details</g:link>
        </div>
    </div>
</div>
</body>
</html>