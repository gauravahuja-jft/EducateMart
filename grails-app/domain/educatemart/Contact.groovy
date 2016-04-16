package educatemart

class Contact {
    String email
    String website
    List phones

    static hasOne = [address:Address]
    static hasMany = [phones:Phone]
    static belongsTo = [school:School]
    static constraints = {
        email(email: true,blank: true,nullable: true)
        website(url: true,blank: true,nullable: true)
    }
}
