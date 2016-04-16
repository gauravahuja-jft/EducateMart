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
    <div class="container center" style="min-width: 90%">
        <table class="striped">
            <thead>
            <tr>
                <th data-field="schoolName">School Name</th>
                <th data-field="address">Address</th>
                <th data-field="board">Board</th>
                <th data-field="schoolType">SchoolType</th>
                <th data-field="genderType">GenderType</th>
                <th data-field="phone1">Phone</th>
                <th data-field="options">Options</th>
            </tr>
            </thead>

            <tbody>
            <g:if test="${schools.empty}">
                <script>
                    Materialize.toast('No Schools to Display', 4000)
                </script>
            </g:if>
            <g:each in="${schools}">
              <tr>
                  <td>${it.schoolName}</td>
                  <td>${it.contact.address.area}, ${it.contact.address.city}</td>
                  <td>${it.board}</td>
                  <td>${it.schoolType}</td>
                  <td>${it.genderType}</td>
                  <td><g:each in="${it.contact.phones}" var="phone">
                      ${phone.number}
                  </g:each></td>
                  <td><g:link action="viewSchool" title="View" params="['schoolId': it.id]"><i
                          class="material-icons">pageview</i></g:link>
                      <g:link action="editSchool" title="Edit" params="['schoolId': it.id]"><i
                              class="material-icons">edit</i></g:link>
                      <g:link action="deleteSchool" title="Delete" params="['schoolId': it.id]"><i
                              class="material-icons">delete</i></g:link>

                  </td>
              </tr>
            </g:each>
            </tbody>
        </table>
        <g:paginate class="pagination" controller="admin" action="showSchools" total="${schoolsCount}"/>


    </div>
</div>
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
    <g:link action="performEdit" class="btn-floating btn-large red">
        <i class="large material-icons">add</i>

    </g:link>

</div>
</body>
</html>