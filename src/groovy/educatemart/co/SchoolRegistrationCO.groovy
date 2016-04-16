package educatemart.co

import educatemart.Address
import educatemart.Board
import educatemart.City
import educatemart.Contact
import educatemart.FeeStructure
import educatemart.GenderType
import educatemart.Grade
import educatemart.PhoneType
import educatemart.School
import educatemart.SchoolInfo
import educatemart.SchoolType
import educatemart.State
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

/**
 * Created by gaurav on 17/3/16.
 */
@Validateable
class SchoolRegistrationCO {
    String schoolId

    String schoolName
    Board board
    SchoolType schoolType
    GenderType genderType
    String addLine1
    State state
    String cityName
    String zipCode
    String areaName
    String email
    String website
    String phone1
    PhoneType ph1type
    String phone2
    PhoneType ph2type

/*
    String profileImageFileName
*/
    MultipartFile logoImage
    MultipartFile profileImage

    Integer numberOfSeats
/*
    Integer numberOfEwsSeats
*/
    Boolean ewsSupport
    String startTiming
    String endTiming
    String formAvailable
    String formClosing

    String[] defaultFacilityIds
    String[] customFacilityIds

    Grade startGrade
    Grade endGrade
    BigDecimal annualFee
    BigDecimal tuitionFee
    String feeNotes
    String principalName
    String message

    static constraints={
        schoolId(nullable: true)
        importFrom School
        importFrom Address

        phone2(nullable: true, blank: true)
        ph2type(nullable: true)
        importFrom Contact
        importFrom SchoolInfo
        importFrom FeeStructure

        defaultFacilityIds(nullable: true)
        customFacilityIds(nullable: true)
        profileImage(nullable: true)
        logoImage(nullable: true)
    }
}
