<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 9/3/16
  Time: 11:57 AM
--%>

<%@ page import="educatemart.SchoolType; educatemart.FacilityType; educatemart.Facility; educatemart.State; educatemart.Board" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" context="admin"/>
    <title>EducateMart Admin</title>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <script>
        $(document).ready(function () {
            $('#cityName').autocomplete({
                source: '<g:createLink controller='admin' action='ajaxCityFinder'/>'
            });
            $('#areaName').autocomplete({
                source: '<g:createLink controller='admin' action='ajaxAreaFinder'/>'
            });
            $('#customFacility').autocomplete({
                source: '<g:createLink controller='admin' action='ajaxCustomFacilityFinder'/>'
            });
            $("#addCustomFacility").click(function(){
                var facilityName = $("#customFacility").val();
                $("#customFacility").val("");
                if(facilityName){
                    $.ajax({url: "/EducateMart/admin/createCustomFacility?facilityName="+facilityName,
                        success: function(result){
                            $("#customFacilitiesCheckboxContainer").append(result);
                        }});
                }
                else
                    Materialize.toast('Enter facility name', 4000)
            });
        });
    </script>
</head>

<body>
<div class="section">
    <div class="container" style="min-width: 80%">
        <g:form controller="admin" action="performEdit" method="post" enctype="multipart/form-data">
            <g:hiddenField name="schoolId" value="${school?.id}"/>
            <h5 class="apptextcolor center">Basic Information</h5>

            <div class="row">
                <div class="input-field col s12">
                    <input name="schoolName" id="schoolName" class="inputFields apptextcolor" type="text"
                           autocomplete="off"
                           required value="${school?.schoolName}">
                    <label for="schoolName">Enter name of school</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="board" class="apptextcolor" from='${Board.values()}' value="${school.board}"/>
                    <label for="board">Board</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="schoolType" class="apptextcolor" from='${educatemart.SchoolType.values()}' value="${school.schoolType}"/>
                    <label for="schoolType">School Type</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="genderType" class="apptextcolor" from='${educatemart.GenderType.values()}' value="${school.genderType}"/>
                    <label for="genderType">Gender Type</label>
                </div>
            </div>

            <div class="row">
                <h5 class="apptextcolor center">Address</h5>

                <div class="input-field col s12">
                    <input name="addLine1" id="addLine1" class="inputFields apptextcolor" type="text" autocomplete="off"
                           required value="${school.contact.address?.addLine1}">
                    <label for="addLine1">Address Line 1</label>
                </div>

                <div class="input-field col s6">
                    <input name="areaName" id="areaName" class="inputFields apptextcolor" type="text" autocomplete="off"
                           required placeholder="Ex. Rajouri Garden, Sector 63.." value="${school.contact.address.area}">
                    <label for="areaName">Area</label>
                </div>


%{--                <div id="updateCity" class="input-field col s4">
                    <g:select id="city" name="city" class="apptextcolor" from='${educatemart.City.all}'
                              optionValue="name" optionKey="id"
                              value="${school.contact.address?.city.id}"/>
                    <label for="city">City</label>
                </div>--}%

                <div class="input-field col s6">
                    <input name="cityName" id="cityName" class="inputFields apptextcolor" type="text" autocomplete="off"
                           value="Noida" required>
                    <label for="cityName">City</label>
                </div>
                <div class="input-field col s6">
                    <g:select id="state" name="state" class="apptextcolor" from='${State.all}'
                              optionValue="name" optionKey="id" value="${school.contact.address.state.id}"/>
                    <label for="state">State</label>
                </div>

                <div class="input-field col s6">
                    <input name="zipCode" id="zipCode" class="inputFields apptextcolor" type="text" autocomplete="off"
                           maxlength="6" required value="${school.contact.address?.zipCode}">
                    <label for="zipCode">Zip Code</label>
                </div>
            </div>


        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%
            <div class="row">
                <h5 class="apptextcolor center">Contact Information</h5>

                <div class="input-field col s6">
                    <input name="email" id="email" class="inputFields apptextcolor" type="email" autocomplete="off" value="${school.contact?.email}">
                    <label for="email">Enter email-id (Optional)</label>
                </div>

                <div class="input-field col s6">
                    <input name="website" id="website" class="inputFields apptextcolor" type="url"
                           autocomplete="off" value="${school.contact?.website}">
                    <label for="website">Enter website (Optional)</label>
                </div>

                <div class="input-field col s4">
                    <input name="phone1" id="phone1" class="inputFields apptextcolor" type="tel" autocomplete="off"
                           required value="${school.contact.phones?.get(0)}">
                    <label for="phone1">Phone 1</label>
                </div>

                <div class="input-field col s2">
                    <g:select name="ph1type" class="apptextcolor" from='${educatemart.PhoneType.values()}'
                              value="${school.contact.phones?.get(0).phoneType}"/>
                    <label for="ph1type">Type</label>
                </div>

                <div class="input-field col s4">
                    <input name="phone2" id="phone2" class="inputFields apptextcolor" type="tel" autocomplete="off"
                           value="${school.contact.phones?.get(1)}">
                    <label for="phone2">Phone 2 (Optional)</label>
                </div>

                <div class="input-field col s2">
                    <g:select name="ph2type" class="apptextcolor" from='${educatemart.PhoneType.values()}'
                              value="${school.contact.phones?.get(1).phoneType}"/>
                    <label for="ph2type">Type (Optional)</label>
                </div>
            </div>

            <div class="row">
                <h5 class="apptextcolor center">Additional Information</h5>
<div class="row">
                <div class="input-field col s6">
                    <input name="numberOfSeats" id="numberOfSeats" class="inputFields apptextcolor" type="number"
                           required  value="${school.schoolInfo?.numberOfSeats}">
                    <label for="numberOfSeats">Total Seats</label>
                </div>

%{--                <div class="input-field col s6">
                    <input name="numberOfEwsSeats" id="numberOfEwsSeats" class="inputFields apptextcolor"
                           type="number" value="${school.schoolInfo?.numberOfEwsSeats}">
                    <label for="numberOfEwsSeats">EWS Seats (Optional)</label>
                </div>--}%
                <div class="col s6 center" style="vertical-align: baseline;">
                    <input type="checkbox" name="ewsSupport" id="ewsSupport"
                    <g:if test="${school.schoolInfo?.ewsSupport}">
                        checked
                    </g:if>
                    />
                    <label class="apptextcolor" for="ewsSupport">Supports EWS</label>
                </div>
</div>
                <div class="input-field col s6">
                    <input name="startTiming" id="startTiming" class="inputFields apptextcolor" type="time" required
                           value="${school.schoolInfo?.startTiming}">
                    <label class="active" for="startTiming">Starting Time</label>
                </div>

                <div class="input-field col s6">
                    <input name="endTiming" id="endTiming" class="inputFields apptextcolor" type="time" required
                           value="${school.schoolInfo?.endTiming}">
                    <label class="active" for="endTiming">Leaving Time</label>
                </div>

                <div class="input-field col s6">
                    <input name="formAvailable" id="formAvailable" class="inputFields apptextcolor" type="date"
                           value="${school.schoolInfo?.formAvailable}">
                    <label class="active" for="formAvailable">Form Available Date (Optional)</label>
                </div>

                <div class="input-field col s6">
                    <input name="formClosing" id="formClosing" class="inputFields apptextcolor" type="date"
                           value="${school.schoolInfo?.formClosing}">
                    <label class="active" for="formClosing">Form Closing Date (Optional)</label>
                </div>
            </div>

        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%

            <div class="row">
                <h5 class="apptextcolor center">Facilities</h5>
                <g:each in="${educatemart.Facility.findAllByFacilityType(educatemart.FacilityType.Default)}">
                    <p class="col s4">
                        <input type="checkbox" name="defaultFacilityIds" id="${it.facilityName}" value="${it.id}"
                        <g:if test="${school.facilities.contains(it)}">
                            checked
                        </g:if>
                        />
                        <label class="apptextcolor" for="${it.facilityName}">${it.facilityName}</label>
                    </p>
                </g:each>

            %{--                    <div class="input-field col s10">
                                    <g:select name="customFacility" id="customFacility" class="apptextcolor"
                                              from="${educatemart.Facility.findAllByFacilityType(educatemart.FacilityType.Custom)}"
                                              optionValue="facilityName" optionKey="id"/>
                                    <label for="customFacility">Additional Facilities</label>
                                </div>--}%

                <div class="col s2">
                    <g:link>Add More</g:link>
                </div>
            </div>


            <div class="row">
                <h5 class="apptextcolor center">Fee Structure</h5>

                <p class="col s2 grey-text">For Grade :</p>

                <div class="input-field col s4">
                    <g:select name="startGrade" id="startGrade" from="${educatemart.Grade.values()}"
                              value="${school.feeStructures.getAt(0)?.startGrade}"/>
                    <label for="startGrade">Starting From</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="endGrade" id="endGrade" from="${educatemart.Grade.values()}"
                              value="${school.feeStructures.getAt(0)?.endGrade}"/>
                    <label for="endGrade">Upto</label>
                </div>

                <div class="input-field col s6">
                    <input name="annualFee" id="annualFee" class="inputFields apptextcolor" type="text"
                           autocomplete="off" required value="${school.feeStructures.getAt(0)?.annualFee}">
                    <label for="annualFee">Annual Fee</label>
                </div>

                <div class="input-field col s6">
                    <input name="tuitionFee" id="tuitionFee" class="inputFields apptextcolor" type="text"
                           autocomplete="off" required value="${school.feeStructures.getAt(0)?.tuitionFee}">
                    <label for="tuitionFee">Tuition Fee</label>
                </div>

                <div class="input-field col s12">
                    <input name="feeNotes" id="feeNotes" class="inputFields apptextcolor" type="text"
                           autocomplete="off" value="${school.feeStructures.getAt(0)?.feeNotes}">
                    <label for="feeNotes">Notes (Optional)</label>
                </div>
            </div>
        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%
            <div class="row">
                <h5 class="apptextcolor center">School Profile</h5>
                <div class="input-field col s12">
                    <input name="principalName" id="principalName" class="inputFields apptextcolor" type="text"
                           autocomplete="off" required value="${school.schoolInfo?.principalName}">
                    <label for="principalName">Principal Name</label>
                </div>

                <div class="input-field col s12">
                    <textarea name="message" id="message" class="materialize-textarea apptextcolor" type="text">${school.schoolInfo?.message}</textarea>
                    <label for="message">Principal's Message (Optional)</label>
                </div>

            </div>

        %{--                <div class="input-field col s12">
                            <input name="famousPersonalities" id="famousPersonalities" class="inputFields apptextcolor" type="text" autocomplete="off">
                            <label for="famousPersonalities">Famous Personalities(Comma Separated)</label>
                        </div>--}%
%{--            <div class="file-field input-field">
                <div class="btn appcolor">
                    <span>Upload School Logo (Optional)</span>
                    <input name="logoFileName" type="file">
                </div>

                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
            </div>--}%
            <div class="file-field input-field">
                <div class="btn appcolor">
                    <span>Upload School Logo</span>
                    <input name="logoImage" type="file">
                </div>

                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text">
                </div>
            </div>
            <div class="file-field input-field">
                <div class="btn appcolor">
                    <span>Upload School Profile Image</span>
                    <input name="profileImage" type="file">
                </div>

                <div class="file-path-wrapper">
                    <input class="file-path validate" type="text"">
                </div>
            </div>
        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%

            <div class="row" style="margin-top: 20px">
                <div class="container center">
                    <g:submitButton name="submit" value="Update"
                                    class="waves-effect waves-light btn green white-text"/>
                </div>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>