<%@ page import="educatemart.Board; educatemart.State;grails.converters.JSON" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>
    <asset:javascript src="geolocation.js"/>
    <script>

        $(document).ready(function () {

            $('#autocompleteState').autocomplete({
                source: '<g:createLink controller='home' action='ajaxSchoolFinder'/>',
                select: function (event, ui) {
                    if (ui.item) {
                        $(event.target).val(ui.item.value);
                    }
                    //submit the form
                    $('#submit').click();
                }
            });

           getCity();

            $("#gotonext").click(function () {
                positionabout = $("#nearbyschools").offset().top - $("#navbarfixed").height(); // Position of #about - nav height = correct position
                $("html, body").animate({scrollTop: positionabout}, '1000', 'swing');
            });
        });
    </script>

</head>

<body>

<main class="green">
    <div id="index-banner"
         style="background-image: url('${resource(dir: "images", file: "classroom.jpg")}');background-size: cover;background-position: center;min-height: 600px;height: auto;position: relative;">
        <div class="section" style="position: relative">
            <div class="container">
                <div class="card-panel"
                     style="background-color: rgba(0, 0, 0, 0.70);border-radius: 10px;margin-top: 150px;">
                    <div class="row">
                        <div class="col s12">
                            <p class="light center white-text"
                               style="font-size: 2em;">Find the best school for your child</p>
                        </div>
                    </div>
                    <g:form controller="home" action="landingSearch">
                        <div class="row">
                            <g:hiddenField name="schoolId"/>

                            <div class="input-field col s10">
                                <div class="ui-widget">
                                    <input name="autocompleteState" id="autocompleteState"
                                           class="inputFields white-text" type="text">
                                    <label class="white-text"
                                           for="autocompleteState">Enter name of school or city</label>
                                </div>
                            </div>

                            <div class="col s2" style="line-height: 60px;">
                                <g:submitButton id="submit" name="submit" value="SEARCH"
                                                class="waves-effect waves-light btn appcolor white-text"/>
                            </div>
                        </div>
                    </g:form>
                </div>

            </div>

        </div>

        <div class="row" style="position:absolute;bottom: 30px;left: 90%">
            <a id="gotonext" class="btn-floating btn-large waves-effect waves-light red"
               title="Find schools nearby you"><i
                    class="large material-icons">keyboard_arrow_down</i></a>
        </div>
    </div>

    <!--   Nearby schools Section   -->

    <div class="container">
        <div class="section">
            <div class="row" id="nearbyschools">
                <p class="center white-text" style="font-size: 2em">Most Viewed Schools</p>
            </div>

            <div class="row">

                <g:each in="${schools}">
                    <div class="col s12 m4">

                        <div class="card-panel" style="height: 340px;">
                            <div class="card-image center">
                                <g:link action="viewSchool" id="${it.id}">
                                    <img src="${request.contextPath}/home/getImage?filepath=${it.schoolInfo.logoImageFileName}"
                                         style="max-width: 50%;max-height: 50%;margin-top: 10px;"/>
                                </g:link>
                            </div>
                            <h5 class="black-text center">${it?.schoolName}</h5>

                            <div class="divider"></div>

                            <p>Board : ${it?.board}</p>

                            <p>Website : ${it.contact?.website}</p>

                            <p>Address : ${it.contact.address?.addLine1}, ${it.contact.address?.area},
                                ${it.contact.address?.zipCode}, ${it.contact.address?.state}</p>
                        </div>
                    </div>

                </g:each>

            </div>
        </div>
    </div>
    <!--   MAPS Section   -->

    %{--    <div class="container">
            <div class="section">

                --}%%{--            <div class="row">
                                <h4 class="col s12 center header white-text">Showing schools near you</h4>
                            </div>--}%%{--
                <div class="row">
                    <div class="col s12 center">
                        <div id="location" class="z-depth-3" style="width: 100%;height: 400px"></div>
                    </div>
                </div>

            </div>
        </div>--}%
    <!--   Recent Reviews   -->
    <div class="section" style="background-color: #AD1457;">
        <p class="center white-text" style="font-size: 2em">Recently Reviewed</p>

        <div class="container" style="padding-top: 1rem;">
            <div class="row">
                <g:each in="${reviews}">
                    <div class="col s12 m4">
                        <div class="card-panel" style="background-color: #777777">
                            <p class="white-text" style="font-size: 1.5em">${it.school?.schoolName}</p>

                            <p class="light white-text" style="font-size: 0.8em">By ${it.user.username}
                                on <g:formatDate date="${it?.dateCreated}" type="date" style="SHORT"/></p>

                            <p class="light white-text" style="font-size: 1.2em">"${it?.text}"</p>
                        </div>
                    </div>
                </g:each>
            </div>
        </div>
    </div>
    <!--   How We Help Section   -->
    <div class="section" style="background-color: #009499;">
        <p class="center white-text" style="font-size: 2em">How We Help</p>

        <div class="container" style="padding-top: 1rem;">
            <div class="row">
                <div class="col s12 m6">
                    <div class="center promo">
                        <g:img dir="images" file="parentsicon.png"/>
                        <p class="center light white-text" style="font-size: 1.5em">Parents</p>

                        <p class="center light white-text"
                           style="font-size: 1.2em">Find Compare and Review Schools</p>
                    </div>
                </div>

                <div class="col s12 m6">
                    <div class="center promo">
                        <g:img dir="images" file="schoolicon.png"/>
                        <p class="center light white-text" style="font-size: 1.5em">Schools</p>

                        <p class="center light white-text"
                           style="font-size: 1.2em">Highlight your Strengths on your School Profile</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
