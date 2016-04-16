package educatemart

class Gallery {
    String[] imageFileNames
    static belongsTo = [school:School]
    static constraints = {
        imageFileNames(nullable: true)
    }
}
