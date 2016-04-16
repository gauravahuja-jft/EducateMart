package educatemart

class FeeComponent {
    String description
    BigDecimal amount
    static belongsTo = [FeeStructure]
    static constraints = {
    }
}
