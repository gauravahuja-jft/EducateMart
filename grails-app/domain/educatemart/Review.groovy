package educatemart

class Review {
    Integer rating=0
    Date dateCreated
    String text
    User user
    Boolean moderated = Boolean.FALSE
    static belongsTo = [school:School]
    static constraints = {
        rating(nullable: true,blank: true)
    }
    static mapping = {
        text type: 'text'
        autoTimestamp true
    }
}
