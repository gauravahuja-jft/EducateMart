<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 30/3/16
  Time: 5:27 PM
--%>
<%@ page import="educatemart.FacilityType; educatemart.Facility; educatemart.State; educatemart.Board" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>EducateMart</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <style>
    i.small{
        font-size: 3rem;
    }
    .centericon{
        vertical-align: middle;
        margin-right: 10px;
    }
    </style>
    <script>
        $(document).ready(function(){
            $('#principalsmessage').readmore()
        })
    </script>
</head>

<body>

<div id="index-banner"
     style="background-image: url('${request.contextPath}/home/getImage?filepath=${school.schoolInfo.profileImageFileName}');background-size: 100% 100%;background-position: center;background-repeat: no-repeat;min-height: 450px;height: auto;position: relative;">
    <div class="card-panel valign-wrapper" style="background-color: rgba(0, 0, 0, 0.70);border-radius: 10px;
    position:absolute;bottom: 30px;left: 10%;
    padding: 10px;">
        <img src="${request.contextPath}/home/getImage?filepath=${school.schoolInfo.logoImageFileName}" class="valign"
             height="80px"/>

        <p class="light white-text" style="font-size: 1.5em;margin-left: 25px">${school.schoolName.toUpperCase()}</p>
    </div>

    <div class="row" style="position:absolute;bottom: 30px;right: 10%">

        <a href="#writeReviewModal" class="btn-floating btn-large waves-effect waves-light red modal-trigger"
           title="Review this School"><i
                class="large material-icons">rate_review</i></a>
    </div>
</div>

<div class="section">
    <div class="container" style="min-width: 95%">
        <div class="row">

            <div id="leftcolumn" class="col s12 m3">
                <div id="contactinfo" class="card-panel" style="background-color: #ffffff">
                    <div class="card-title apptextcolor" style="font-size: 1.2em;">Contact Information</div>

                    <div class="divider"></div>
                        <g:if test="${school.contact.email}">
                            <p><i class="material-icons centericon">email</i>${school.contact.email}
                            </p>
                        </g:if>

                    <g:if test="${school.contact.website}">
                        <p><i class="material-icons centericon">link</i><a
                            href="${school.contact.website}">${school.contact.website}</a></p>
                    </g:if>
                    <p><i class="material-icons centericon">phone</i>${school.contact.phones.getAt(0).number}(${school.contact.phones.getAt(0).phoneType})
                    </p>
                    <g:if test="${school.contact.phones.get(1)}">
                        <p><i class="material-icons centericon">phone</i>${school.contact.phones.getAt(1).number}(${school.contact.phones.getAt(1).phoneType})
                        </p>
                    </g:if>
                    <g:if test="${school.contact.address}">
                        <p><i class="material-icons centericon">location_on</i>${school.contact.address.addLine1}, ${school.contact.address.area}, ${school.contact.address.city}, ${school.contact.address.state}
                        </p>
                    </g:if>
                </div>

                <div id="reviews" class="card-panel" style="background-color: #ffffff">
                    <div class="card-title apptextcolor" style="font-size: 1.2em;">Reviews</div>

                    <div class="divider"></div>
                    <g:if test="${school.review}">
                        <g:each in="${school.review}">
                            <g:if test="${it.moderated}">
                                <p>${it.text}</p>

                                <p class="light" style="font-size: 0.9em">Reviewed by : ${it.user.username}</p>
                                <div class="divider"></div>

                            </g:if>
                        </g:each>
                    </g:if>
                    <g:else>
                        <a class="modal-trigger" href="#writeReviewModal">No Review Yet. Be the first one to review this school</a>

                    </g:else>
                    <a class="modal-trigger" href="#readReviewsModal">Read All Reviews</a>

                </div>
            </div>

            <div id="middlecolumn" class="col s12 m6">
                <div id="schooloverview" class="card-panel" style="background-color: #ffffff">
                    <div class="card-title apptextcolor" style="font-size: 1.2em;">School Overview</div>

                    <div class="divider"></div>
                    <g:if test="${school.schoolInfo.numberOfSeats}">
                        <p><i class="material-icons small centericon">people</i>Average Seats in a Classroom ${school.schoolInfo.numberOfSeats}</p>
                    </g:if>

                    <g:if test="${school.schoolInfo?.ewsSupport}">
                        <p><i class="material-icons small centericon">done</i>EWS Seats</p>
                    </g:if>
                    <g:else>
                        <p><i class="material-icons small centericon">close</i>EWS Seats</p>
                    </g:else>

                    <g:if test="${school.schoolInfo.startTiming}">
                        <p><i class="material-icons small centericon">watch_later</i>School Timings ${school.schoolInfo.startTiming} - ${school.schoolInfo.endTiming}</p>
                    </g:if>
                    <g:if test="${school.schoolInfo.formAvailable}">
                        <p><i class="material-icons small centericon">date_range</i>Form Availability Period ${school.schoolInfo.formAvailable} - ${school.schoolInfo.formClosing}</p>
                    </g:if>
                    <p><i class="material-icons small centericon">grade</i>Facilities</p>
                    <g:each in="${school.facilities}">
                        <input type="checkbox" name="facilityName" id="facilityName" disabled checked/>
                        <label class="black-text" for="facilityName">${it.facilityName}</label><br>
                    </g:each>
                </div>

                <div id="feestructure" class="card-panel" style="background-color: #ffffff">
                    <div class="card-title apptextcolor" style="font-size: 1.2em;">Fee Structure</div>

                    <div class="divider"></div>

                    <p>Fee Structure1 Starting Grade   :${school.feeStructures.getAt(0).startGrade}</p>

                    <p>Fee Structure1 Ending Grade     :${school.feeStructures.getAt(0).endGrade}</p>

                    <p>Fee Structure1 Annual Fee       :${school.feeStructures.getAt(0).annualFee}</p>

                    <p>Fee Structure1 Tuition Fee      :${school.feeStructures.getAt(0).tuitionFee}</p>

                    <p>Fee Structure1 Notes            :${school.feeStructures.getAt(0).feeNotes}</p>
                </div>

            </div>

            <div id="rightcolumn" class="col s12 m3">
                <div id="principalsdesk" class="card-panel" style="background-color: #ffffff;overflow: hidden">
                    <div class="card-title apptextcolor" style="font-size: 1.2em;">Principal's Desk</div>
                    <div class="divider"></div>
                    <div id="principalsmessage">
                        <g:if test="${school.schoolInfo.principalName}">
                            <p class="center">${school.schoolInfo.principalName}</p>
                        </g:if>
                        <g:if test="${school.schoolInfo.message}">
                            <p class="center">${school.schoolInfo.message}</p>
                        </g:if>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>


<!-- Modal Structure -->
<div id="writeReviewModal" class="modal">
    <g:form controller="home" action="writeReview">

        <div class="modal-content">
            <h4>Review</h4>
            <g:hiddenField name="schoolId" value="${school?.id}"/>
            <div class="input-field col s12">
                <textarea name="schoolReview" id="schoolReview" class="materialize-textarea apptextcolor"
                          type="text"></textarea>
                <label for="schoolReview">Write your review</label>
            </div>
        </div>

        <p class="light center"
           style="font-size: 0.8em">Thank You. Your review will be available as soon as a moderator approves it.</p>

        <div class="modal-footer">
            <g:submitButton name="submitReview" value="Submit"
                            class="modal-action modal-close waves-effect waves-green btn-flat"/>
        </div>
    </g:form>
</div>
<div id="readReviewsModal" class="modal modal-close">
    <div class="modal-content">
        <h4>Reviews (${school.schoolName})</h4>
        <g:if test="${school.review}">
            <g:each in="${school.review}">
                <g:if test="${it.moderated}">
                    <p class="light">Reviewed by : ${it.user.username}</p>
                    <p class="light">${it.text}</p>
                    <div class="divider"></div>
                </g:if>
            </g:each>
        </g:if>
        <g:else>
            <a href="#writeReviewModal">No Review Yet. Be the first one to review this school</a>
        </g:else>
    </div>
    <div class="modal-footer">
        <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>

    </div>
</body>
</html>