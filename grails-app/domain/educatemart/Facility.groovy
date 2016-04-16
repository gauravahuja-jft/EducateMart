package educatemart

/*class Facility {
    String facilityType
    School school
    static constraints = {
        school(nullable: true)
    }
}*/

class Facility{
    String facilityName
    FacilityType facilityType = FacilityType.Default
    static constraints = {
        facilityName(nullable: false,blank: false,unique: true)
    }
/*
    FacilityType facilityType = FacilityType.Custom /////To be enabled when custom facilities are enabled
*/
}
