package educatemart

class FeeStructure {
    Grade startGrade
    Grade endGrade
    BigDecimal annualFee
    BigDecimal tuitionFee
    String feeNotes
    static hasMany = [feeComponents:FeeComponent]
    static belongsTo = [school:School]
    static constraints = {
        feeNotes(nullable: true,blank: true)
    }
}
