package educatemart

import educatemart.co.SchoolRegistrationCO
import grails.transaction.Transactional

@Transactional
class RegistrationService {
    def fileUploadService

    def registerSchool(Address address, Contact contact, SchoolInfo schoolInfo, FeeStructure feeStructure, School school, SchoolRegistrationCO registrationCO) {
        def profileImageFileName
        def logoImageFileName
        City city
        if (City.findByName(registrationCO.cityName))
            city = City.findByName(registrationCO.cityName)
        else {
            city = new City(name: registrationCO.cityName, state: address.state).save()
            address.state.addToCities(city)
        }
        address.city=city

        Area area
        if (Area.findByName(registrationCO.areaName))
            area = Area.findByName(registrationCO.areaName)
        else {
            area = new Area(name: registrationCO.areaName, city: address.city).save()
            address.city.addToAreas(area)
        }


        address.area = area
        contact.address = address
        address.setContact(contact)
        school.setSchoolInfo(schoolInfo)
        school.setContact(contact)
        school.addToFeeStructures(feeStructure)

        for (facilityId in registrationCO.defaultFacilityIds)
        {
            school.addToFacilities(Facility.get(facilityId))
        }
        for (facilityId in registrationCO.customFacilityIds)
        {
            school.addToFacilities(Facility.get(facilityId))
        }
        school.save()
        //schoolInfo.setSchool(school)
        //contact.setSchool(school)
        //contact.save()

        Phone phone1 = new Phone()
        Phone phone2 = new Phone()

        phone1.number = registrationCO.phone1
        phone1.phoneType = registrationCO.ph1type
        phone1.setContact(contact)
        //phone1.save()
        phone2.number = registrationCO?.phone2
        phone2.phoneType = registrationCO?.ph2type
        phone2.setContact(contact)
        //phone2.save()
        contact.addToPhones(phone1)
        contact.addToPhones(phone2)

        // Save logo image if uploaded
        def logoImage = registrationCO.logoImage
        if (!logoImage.isEmpty()) {
            logoImageFileName = fileUploadService.uploadFile(logoImage, "logoImage", school.id)

            schoolInfo.logoImageFileName = logoImageFileName
            println '//////////////////////////////////Uploaded   ' + logoImageFileName
        }
        // Save profile image if uploaded
        def profileImage = registrationCO.profileImage
        if (!profileImage.isEmpty()) {
            profileImageFileName = fileUploadService.uploadFile(profileImage, "profileImage", school.id)

            schoolInfo.profileImageFileName = profileImageFileName
            println '//////////////////////////////////Uploaded   ' + profileImageFileName

        }


        address.save()
        contact.save()
        schoolInfo.save()
        feeStructure.save()
        school.save()
    }

    def editSchool(Address address, Contact contact, SchoolInfo schoolInfo, FeeStructure feeStructure, School school, SchoolRegistrationCO registrationCO) {
        def profileImageFileName
        def logoImageFileName

        school.id = registrationCO.schoolId
        City city
        if (City.findByName(registrationCO.cityName))
            city = City.findByName(registrationCO.cityName)
        else {
            city = new City(name: registrationCO.cityName, state: address.state).save()
            address.state.addToCities(city)
        }
        address.city=city

        Area area
        if (Area.findByName(registrationCO.areaName))
            area = Area.findByName(registrationCO.areaName)
        else {
            area = new Area(name: registrationCO.areaName, city: address.city).save()
            address.city.addToAreas(area)
        }


        address.area = area
        contact.address = address
        address.setContact(contact)
        school.setSchoolInfo(schoolInfo)
        school.setContact(contact)
        school.addToFeeStructures(feeStructure)

        for (facilityId in registrationCO.defaultFacilityIds)       //////////////Facilities will be multiple later on
        {
            school.addToFacilities(Facility.get(facilityId))
        }
        school.save()
        //schoolInfo.setSchool(school)
        //contact.setSchool(school)
        //contact.save()

        Phone phone1 = contact.phones.get(0)
        Phone phone2 = contact.phones.get(1)
        phone1.number = registrationCO.phone1
        phone1.phoneType = registrationCO.ph1type
        //phone1.setContact(contact)
        phone1.save()
        phone2.number = registrationCO?.phone2
        phone2.phoneType = registrationCO?.ph2type
        //phone2.setContact(contact)
        phone2.save()
        //contact.addToPhones(phone1)
        //contact.addToPhones(phone2)

        // Save logo image if uploaded
        def logoImage = registrationCO.logoImage
        if (!logoImage.isEmpty()) {

            logoImageFileName = fileUploadService.uploadFile(logoImage, "logoImage", school.id)

            schoolInfo.logoImageFileName = logoImageFileName
            println '//////////////////////////////////Uploaded   ' + logoImageFileName
        }
        // Save profile image if uploaded
        def profileImage = registrationCO.profileImage
        if (!profileImage.isEmpty()) {

            profileImageFileName = fileUploadService.uploadFile(profileImage, "profileImage", school.id)

            schoolInfo.profileImageFileName = profileImageFileName
            println '//////////////////////////////////Uploaded   ' + profileImageFileName

        }

        address.save()
        contact.save()
        schoolInfo.save()
        feeStructure.save()
        school.save()
    }

}
