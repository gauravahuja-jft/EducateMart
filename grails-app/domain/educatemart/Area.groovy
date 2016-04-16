package educatemart

class Area {
String name
    static belongsTo = [city:City]
    static constraints = {
        name(nullable: false,blank: false,unique: true)
    }
    public String toString() {
        return name
    }
}
