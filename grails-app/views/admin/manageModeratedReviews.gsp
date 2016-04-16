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
        <div class="card-panel">
            <div class="card-title">Approved Reviews</div>
        <table class="striped">
            <thead>
            <tr>
                <th data-field="userName">School</th>
                <th data-field="review">Review</th>
                <th data-field="location">User</th>
                <th data-field="board">Date Created</th>
                <th data-field="schoolType">Options</th>
            </tr>
            </thead>

            <tbody>

            <g:each in="${moderatedReviews}">
                <tr>
                    <td>${it.school.schoolName}</td>
                    <td>${it.text}</td>
                    <td>${it.user.username}</td>
                    <td><g:formatDate date="${it?.dateCreated}" type="date" style="SHORT"/></td>
                    <td>
%{--
                        <g:link action="moderateReview" params="['reviewId': it.id]">Moderate</g:link>
--}%
                        <g:link action="deleteReview" params="['reviewId': it.id]"><i class="material-icons">delete</i></g:link>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
            <g:paginate class="pagination" controller="admin" action="manageModeratedReviews" total="${moderatedReviewsCount}" max="3"/>

        </div>

    </div>
</div>
</body>
</html>