<%--
  Created by IntelliJ IDEA.
  User: gaurav
  Date: 9/3/16
  Time: 11:57 AM
--%>

<%@ page import="educatemart.FacilityType; educatemart.Facility; educatemart.State; educatemart.Board" contentType="text/html;charset=UTF-8" %>
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
        <g:form controller="admin" action="performReg" method="post" enctype="multipart/form-data">
            <h5 class="apptextcolor center">Basic Information</h5>

            <div class="row">
                <div class="input-field col s12">
                    <input name="schoolName" id="schoolName" class="inputFields apptextcolor validate" type="text"
                           autocomplete="off"
                           required value="Test School Name ">
                    <label for="schoolName">Enter name of school</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="board" class="apptextcolor" from='${educatemart.Board.values()}'/>
                    <label for="board">Board</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="schoolType" class="apptextcolor" from='${educatemart.SchoolType.values()}'/>
                    <label for="schoolType">School Type</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="genderType" class="apptextcolor" from='${educatemart.GenderType.values()}'/>
                    <label for="genderType">Gender Type</label>
                </div>
            </div>

            <div class="row">
                <h5 class="apptextcolor center">Address</h5>

                <div class="input-field col s12">
                    <input name="addLine1" id="addLine1" class="inputFields apptextcolor validate" type="text"
                           autocomplete="off"
                           required value="Test Address Line1  ">
                    <label for="addLine1">Address Line 1 or Building Number or Street Name</label>
                </div>

                <div class="input-field col s6">
                    <div class="ui-widget">
                        <input name="areaName" id="areaName" class="inputFields apptextcolor validate" type="text"
                               autocomplete="off"
                               required placeholder="Ex. Rajouri Garden, Sector 63..">
                        <label for="areaName">Area</label>
                    </div>
                </div>

                <div class="input-field col s6">
                    <div class="ui-widget">
                        <input name="cityName" id="cityName" class="inputFields apptextcolor validate" type="text"
                               autocomplete="off"
                               value="Noida" required>
                        <label for="cityName">City</label>
                    </div>
                </div>

                <div class="input-field col s6">
                    <g:select id="state" name="state" class="apptextcolor" from='${educatemart.State.all}'
                              optionValue="name" optionKey="id"/>
                    <label for="state">State</label>
                </div>

                <div class="input-field col s6">
                    <input name="zipCode" id="zipCode" class="inputFields apptextcolor validate" type="text"
                           autocomplete="off"
                           maxlength="6" value="110015" required>
                    <label for="zipCode">Zip Code</label>
                </div>
            </div>


        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%
            <div class="row">
                <h5 class="apptextcolor center">Contact Information</h5>

                <div class="input-field col s6">
                    <input name="email" id="email" class="inputFields apptextcolor validate" type="email"
                           autocomplete="off">
                    <label for="email">Enter email-id (Optional)</label>
                </div>

                <div class="input-field col s6">
                    <input name="website" id="website" class="inputFields apptextcolor validate" type="url"
                           value="http://"
                           autocomplete="off">
                    <label for="website">Enter website (Optional)</label>
                </div>

                <div class="input-field col s4">
                    <input name="phone1" id="phone1" class="inputFields apptextcolor validate" type="tel"
                           autocomplete="off"
                           required value="123456789 ">
                    <label for="phone1">Phone 1</label>
                </div>

                <div class="input-field col s2">
                    <g:select name="ph1type" class="apptextcolor" from='${educatemart.PhoneType.values()}'/>
                    <label for="ph1type">Type</label>
                </div>

                <div class="input-field col s4">
                    <input name="phone2" id="phone2" class="inputFields apptextcolor validate" type="tel"
                           autocomplete="off">
                    <label for="phone2">Phone 2 (Optional)</label>
                </div>

                <div class="input-field col s2">
                    <g:select name="ph2type" class="apptextcolor" from='${educatemart.PhoneType.values()}'/>
                    <label for="ph2type">Type (Optional)</label>
                </div>
            </div>

            <div class="row">
                <h5 class="apptextcolor center">Additional Information</h5>

                <div class="row">
                    <div class="input-field col s6">
                        <input name="numberOfSeats" id="numberOfSeats" class="inputFields apptextcolor validate"
                               type="number"
                               required value="150">
                        <label for="numberOfSeats">Average Seats in each Class</label>
                    </div>

                    %{--<div class="input-field col s6">
                        <input name="numberOfEwsSeats" id="numberOfEwsSeats" class="inputFields apptextcolor"
                               type="number">
                        <label for="numberOfEwsSeats">EWS Seats (Optional)</label>
                    </div>--}%
                    <div class="col s6 center" style="vertical-align: baseline;">
                        <g:checkBox name="ewsSupport" id="ewsSupport"/>
                        %{--
                                        <input type="checkbox" name="ewsSupport" id="ewsSupport"/>
                        --}%
                        <label class="apptextcolor" for="ewsSupport">Supports EWS</label>
                    </div>
                </div>

                <div class="input-field col s6">
                    <input name="startTiming" id="startTiming" class="inputFields apptextcolor validate" type="time"
                           required
                           value="08:00:00">
                    <label class="active" for="startTiming">Starting Time</label>
                </div>

                <div class="input-field col s6">
                    <input name="endTiming" id="endTiming" class="inputFields apptextcolor validate" type="time"
                           required
                           value="14:30:00">
                    <label class="active" for="endTiming">Leaving Time</label>
                </div>

                <div class="input-field col s6">
                    <input name="formAvailable" id="formAvailable" class="inputFields apptextcolor validate"
                           type="date">
                    <label class="active" for="formAvailable">Form Available Date (Optional)</label>
                </div>

                <div class="input-field col s6">
                    <input name="formClosing" id="formClosing" class="inputFields apptextcolor validate" type="date">
                    <label class="active" for="formClosing">Form Closing Date (Optional)</label>
                </div>
            </div>

        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%

            <div class="row">
                <div id="defaultFacilitiesCheckboxContainer">
                    <h5 class="apptextcolor center">Facilities</h5>
                    <g:each in="${educatemart.Facility.findAllByFacilityType(educatemart.FacilityType.Default)}">
                        <p class="col s4">
                            <input type="checkbox" name="defaultFacilityIds" id="${it.facilityName}" value="${it.id}"/>
                            <label class="apptextcolor" for="${it.facilityName}">${it.facilityName}</label>
                        </p>
                    </g:each>
                </div>
            </div>
            <div class="row">
            <div id="customFacilitiesCheckboxContainer">

            </div>
            </div>

            <div class="row">
                <div class="input-field col s6">
                    <div class="ui-widget">

                        <input name="customFacility" id="customFacility" class="inputFields apptextcolor validate"
                               type="text"
                               autocomplete="off">
                        <label for="customFacility">Enter facilities not listed above</label>
                    </div>
                </div>

                <div class="col s2" style="line-height: 65px">
                    <a id="addCustomFacility" class="btn-floating waves-effect waves-light appcolor"><i
                            class="material-icons">add</i></a>
                </div>
            </div>

            <div class="row">
                <h5 class="apptextcolor center">Fee Structure</h5>

                <p class="col s2 grey-text">For Grade :</p>

                <div class="input-field col s4">
                    <g:select name="startGrade" id="startGrade" from="${educatemart.Grade.values()}"/>
                    <label for="startGrade">Starting From</label>
                </div>

                <div class="input-field col s4">
                    <g:select name="endGrade" id="endGrade" from="${educatemart.Grade.values()}"/>
                    <label for="endGrade">Upto</label>
                </div>

                <div class="input-field col s6">
                    <input name="annualFee" id="annualFee" class="inputFields apptextcolor" type="text"
                           autocomplete="off" required value="90000">
                    <label for="annualFee">Annual Fee</label>
                </div>

                <div class="input-field col s6">
                    <input name="tuitionFee" id="tuitionFee" class="inputFields apptextcolor" type="text"
                           autocomplete="off" required value="6000">
                    <label for="tuitionFee">Tuition Fee</label>
                </div>

                <div class="input-field col s12">
                    <input name="feeNotes" id="feeNotes" class="inputFields apptextcolor" type="text"
                           autocomplete="off">
                    <label for="feeNotes">Notes (Optional)</label>
                </div>
            </div>
        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%
            <div class="row">
                <h5 class="apptextcolor center">School Profile</h5>

                <div class="input-field col s12">
                    <input name="principalName" id="principalName" class="inputFields apptextcolor validate" type="text"
                           autocomplete="off" required value="Dr. S.R Pandey">
                    <label for="principalName">Principal Name</label>
                </div>

                <div class="input-field col s12">
                    <textarea name="message" id="message" class="materialize-textarea apptextcolor validate"
                              type="text"></textarea>
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
                    <input class="file-path validate" type="text">
                </div>
            </div>
        %{--/////////////////////////////////////////////////////////////////////////////////////////////--}%

            <div class="row" style="margin-top: 20px">
                <div class="container center">
                    <g:submitButton name="submit" value="Register"
                                    class="waves-effect waves-light btn green white-text"/>
                </div>
            </div>
        </g:form>
    </div>
</div>
</body>
</html>