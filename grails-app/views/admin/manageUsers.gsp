<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 26/3/16
  Time: 11:05 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="admin"/>
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
    <div class="container center" style="min-width: 80%">
        <table class="striped">
            <thead>
            <tr>
                <th data-field="userName">UserName</th>
                <th data-field="location">Authority</th>
                <th data-field="board">Enabled</th>
                <th data-field="schoolType">Password Expired</th>
                <th data-field="options">Options</th>

            </tr>
            </thead>

            <tbody>
            <g:if test="${allUsers.empty}">
                <script>
                    Materialize.toast('No Users to Display', 4000)
                </script>
            </g:if>
            <g:each in="${allUsers}">
              <tr>
                  <td>${it.username}</td>
                  <td>${it.authorities}</td>
                  <td>${it.enabled}</td>
                  <td>${it.passwordExpired}</td>
                  <td>
                      <g:if test="${it.enabled}">
                      <g:link action="disableUser" params="['userId':it.id]">Disable</g:link>
                      </g:if>
                      <g:else>
                          <g:link action="enableUser" params="['userId':it.id]">Enable</g:link>
                      </g:else>
                  </td>
              </tr>
            </g:each>
            </tbody>
        </table>
        <g:paginate class="pagination" controller="admin" action="manageUsers" total="${usersCount}" max="7"/>

    </div>
</div>
</body>
</html>