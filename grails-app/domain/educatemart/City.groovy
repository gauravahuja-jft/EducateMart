package educatemart

class City {
    String name
    static belongsTo = [state:State]
    static hasMany = [areas:Area]
    static constraints = {
        name(nullable: false,blank: false,unique: true)
    }
    public String toString() {
        return name
    }
}
