package educatemart

import educatemart.co.SchoolRegistrationCO
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class AdminController {
    static allowedMethods = [performReg: "POST"]

    def registrationService

    def index() {
        redirect(action: 'showSchools')
    }

    def showSchools() {
        if (!params.max) {
            params.max = 7
        }
        def allSchools = School.list(params)
        render(view: 'showSchools', model: [schools: allSchools, schoolsCount: School.count])
    }


    def regForm() {
        render(view: 'schoolRegistrationForm')
    }
    def ajaxCityFinder = {
        def citiesFound = City.withCriteria {
            ilike 'name', params.term + '%'
        }
        render(citiesFound.name as JSON)
    }
    def ajaxAreaFinder = {
        def areasFound = Area.withCriteria {
            ilike 'name', params.term + '%'
        }
        render(areasFound.name as JSON)
    }
    def ajaxCustomFacilityFinder = {
        def facilitiesFound = Facility.withCriteria {
            ilike 'facilityName', params.term + '%'
        }
        render(facilitiesFound.facilityName as JSON)
    }

    def editSchool() {
        School school = School.findById(params?.schoolId)
        render(view: 'editForm', model: [school: school])
    }

    def viewSchool() {
        School school = School.findById(params?.schoolId)
        render(view: 'schoolDetails', model: [school: school])
    }

    def addDefaultFacility() {
        Facility facility = new Facility()
        facility.facilityName = params?.facilityName
        facility.facilityType = FacilityType.Default
        if (facility.save(flush: true)) {
            flash.message = "Facility added"
            redirect(action: 'manageDefaultFacilities')
        }
    }

    def addCustomFacility() {
        Facility facility = new Facility()
        facility.facilityName = params?.facilityName
        facility.facilityType = FacilityType.Custom
        if (facility.save(flush: true)) {
            flash.message = "Facility added"
            redirect(action: 'manageCustomFacilities')
        }
    }
    def makeDefaultFacility(){
        Facility facility = Facility.findById(params?.facilityId)
        facility.facilityType=FacilityType.Default
        facility.save(flush: true)
        redirect(action: 'manageDefaultFacilities')
    }
    def deleteFacility() {
        Facility facility = Facility.findById(params?.facilityId)
        try {
            facility.delete(flush: true)
            flash.message = "Facility deleted"
            redirect(uri: request.getHeader('referer'))
        }
        catch (Exception e) { /////////////////////TODO check exception type
            flash.message = "Facility in use. Cannot be deleted"
            redirect(uri: request.getHeader('referer'))
        }
    }

    def deleteSchool() {
        School school = School.findById(params?.schoolId)
        school.delete(flush: true)
        flash.message = "School Deleted"
        redirect(action: 'showSchools')
    }

    def manageDefaultFacilities() {
        if (!params.max) {
            params.max = 10
        }
        def allDefaultFacilities = Facility.findAllByFacilityType(FacilityType.Default,params)
        render(view: 'manageDefaultFacilities', model: [allDefaultFacilities: allDefaultFacilities, defaultFacilitiesCount: allDefaultFacilities.count])
    }
    def manageCustomFacilities() {
        if (!params.max) {
            params.max = 10
        }
        def allCustomFacilities = Facility.findAllByFacilityType(FacilityType.Custom,params)
        render(view: 'manageCustomFacilities', model: [allCustomFacilities: allCustomFacilities, customFacilitiesCount: allCustomFacilities.count])
    }
    def manageUsers() {
        if (!params.max) {
            params.max = 7
        }
        def allUsers = User.list(params)
        render(view: 'manageUsers', model: [allUsers: allUsers, usersCount:User.count])
    }
def disableUser(){
    def user = User.findById(params?.userId)
    user.setEnabled(false)
    user.save(flush: true)
    flash.message="User Disabled"
    redirect(action: 'manageUsers')
}
    def enableUser(){
        def user = User.findById(params?.userId)
        user.setEnabled(true)
        user.save(flush: true)
        flash.message="User Enabled"
        redirect(action: 'manageUsers')
    }
    def manageUnmoderatedReviews() {
        if (!params.max) {
            params.max = 3
        }
        def unmoderatedReviews = Review.findAllByModerated(Boolean.FALSE)
        render(view: 'manageUnmoderatedReviews', model: ['unmoderatedReviews': unmoderatedReviews, 'unmoderatedReviewsCount':unmoderatedReviews.count])
    }

    def manageModeratedReviews() {
        if (!params.max) {
            params.max = 3
        }
        def moderatedReviews = Review.findAllByModerated(Boolean.TRUE)
        render(view: 'manageModeratedReviews', model: ['moderatedReviews': moderatedReviews, 'moderatedReviewsCount':moderatedReviews.count])
    }

    def moderateReview() {
        Review review = Review.findById(params?.reviewId)
        review.moderated = Boolean.TRUE
        review.save(flush: true)
        redirect(action: 'manageUnmoderatedReviews')
    }

    def deleteReview() {
        Review.findById(params?.reviewId).delete(flush: true)
        redirect(uri: request.getHeader('referer'))

    }
def createCustomFacility(){
    def facilityName = params?.facilityName
    Facility facility = new Facility(facilityName: facilityName,facilityType: FacilityType.Custom)
    facility.save(flush: true)
    render(template: 'customFacility',model: ['facility':facility])
}
    def performReg(SchoolRegistrationCO regCO) {

        regCO.validate();
        if (regCO.hasErrors()) {
            render('Error validating page1CO ' + regCO.getErrors().properties)
        } else {
            Address address = new Address()
            Contact contact = new Contact()
            SchoolInfo schoolInfo = new SchoolInfo()
            School school = new School()
            FeeStructure feeStructure = new FeeStructure()       //////////////FeeStructures will be multiple later on

            bindData(address, regCO)
            bindData(contact, regCO)
            bindData(schoolInfo, regCO)
            bindData(school, regCO)
            bindData(feeStructure, regCO)

            try {
                registrationService.registerSchool(address, contact, schoolInfo, feeStructure, school, regCO)
                render(view: 'schoolRegistrationSuccess', model: [school: school])
            }
            catch (Exception e) {
                render e.message
            }
        }
    }

    def performEdit(SchoolRegistrationCO regCO) {
/*
        def profileImageFileName
*/
        regCO.validate();
        if (regCO.hasErrors()) {
            render('Error validating page1CO ' + regCO.getErrors().properties)
        } else {
            School school = School.findById(regCO.schoolId)
            Contact contact = school.contact
            Address address = contact.address
            SchoolInfo schoolInfo = school.schoolInfo
            FeeStructure feeStructure = school.feeStructures.getAt(0)
            //////////////FeeStructures will be multiple later on

            bindData(address, regCO)
            bindData(contact, regCO)
            bindData(schoolInfo, regCO)
            bindData(school, regCO)
            bindData(feeStructure, regCO)

            // Save profile image if uploaded
            /*         def profileImage = regCO.profileImage
                     if (!profileImage.isEmpty()) {
                         ////////
                         profileImageFileName = fileUploadService.uploadFile(profileImage, "profileImage.png", schoolInfo.id.toString())
                         /////////////
                         schoolInfo.profileImageFileName = profileImageFileName
                     }
         */
            try {
                registrationService.editSchool(address, contact, schoolInfo, feeStructure, school, regCO)
                render(view: 'schoolRegistrationSuccess', model: [school: school])
            }
            catch (Exception e) {
                render e.message
            }
        }
    }
}
