package educatemart

class State implements Serializable{
    String name
    static hasMany = [cities:City]
    static constraints = {
        name(nullable: false,blank: false,unique: true)
    }
    public String toString() {
        return name
    }
}
