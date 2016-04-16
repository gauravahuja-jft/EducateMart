package educatemart

class SchoolInfo {
    String principalName
    String message
    String logoImageFileName
    String profileImageFileName
    Integer numberOfSeats
/*
    Integer numberOfEwsSeats
*/
    Boolean ewsSupport
    String startTiming
    String endTiming
    String formAvailable
    String formClosing
/*
    String[] famousPersonalities             /////Disable for now, not important
*/
    static belongsTo = [school:School]
    static constraints = {
        profileImageFileName(nullable: true,blank: true)
/*
        numberOfEwsSeats(nullable: true)
*/
        ewsSupport(nullable: false)
        formAvailable(nullable: true)
        formClosing(nullable: true)
        ///////////////temporary till page 4 complete////////////
        message(nullable: true,blank: true)
        logoImageFileName(nullable: true,blank: true)
        profileImageFileName(nullable: true,blank: true)
        /////////////////////////////////////////////////////////
    }
    static mapping = {
        message type: 'text'
    }
}
