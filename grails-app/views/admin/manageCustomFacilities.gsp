<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 26/3/16
  Time: 6:47 PM
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
        <g:form controller="admin" action="addCustomFacility">
            <div class="row">
                <div class="input-field col s5">
                    <input name="facilityName" id="facilityName" class="inputFields apptextcolor" type="text"
                           autocomplete="off"
                           required>
                    <label for="facilityName">Enter Facility Name</label>
                </div>

                <div class="col s2">
                    <g:submitButton name="submit" value="ADD"
                                    class="waves-effect waves-light btn appcolor white-text"/>
                </div>
            </div>
        </g:form>

    %{--        <ul class="collection">
                <g:each in="${allDefaultFacilities}">
                    <li class="collection-item">${it.facilityName}
                    <g:link action="deleteFacility" params="['facilityId':it.id]" class="secondary-content">Delete</g:link>
                    </li>
                </g:each>
            </ul>--}%

        <table class="striped">
            <thead>
            <tr>
                <th data-field="facilityName">School Name</th>
                <th data-field="options">Options</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${allCustomFacilities}">
                <tr>
                    <td>${it.facilityName}</td>
                    <td>
                        <g:link action="deleteFacility" params="['facilityId': it.id]" title="Delete"><i class="material-icons">delete</i></g:link>
                        <g:link action="makeDefaultFacility" params="['facilityId': it.id]" title="Change Type"><i class="material-icons">swap_vertical_circle</i></g:link>

                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <g:paginate class="pagination" controller="admin" action="manageCustomFacilities" total="${customFacilitiesCount}" max="7"/>

    </div>
</div>
</body>
</html>