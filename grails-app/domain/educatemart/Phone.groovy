package educatemart

class Phone {
    PhoneType phoneType
    String number
    static belongsTo = [contact:Contact]
    static constraints = {
        phoneType(nullable: true,blank:true)
        number(nullable: true,blank: true)
    }
    public String toString() {
        return number
    }
}
