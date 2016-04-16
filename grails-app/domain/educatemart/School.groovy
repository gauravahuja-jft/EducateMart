package educatemart

class School {
    String id
    String schoolName
    Board board
    SchoolType schoolType
    GenderType genderType
/*Temporarily commented till page 4 complete
        static hasMany = [feeStructures:FeeStructure,reviews:Review,facilities:Facility,review:Review]
        static hasOne = [contact:Contact,gallery:Gallery,schoolInfo:SchoolInfo]
*/
    static hasMany = [feeStructures: FeeStructure, facilities: Facility, review: Review]
    static hasOne = [contact: Contact, schoolInfo: SchoolInfo]
    static constraints = {

    }
    static mapping = {
        id generator: 'uuid'
    }
}
