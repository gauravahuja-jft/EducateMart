package educatemart

class Address {
    String addLine1
    String zipCode
    Double latitude
    Double longitude
    City city
    State state
    Area area
    static belongsTo = [contact:Contact]
    static constraints = {
        addLine1(blank: false)
        zipCode(maxSize: 6)
        city(nullable: false)
        state(nullable: false)
        area(nullable: false)
        latitude(nullable: true)
        longitude(nullable: true)
    }
}
