package educatemart.co

import educatemart.User
import grails.validation.Validateable

/**
 * Created by gaurav on 15/4/16.
 */
@Validateable
class UserRegistrationCO {
    String name
    String email
    String username
    String password

    static constraints={
        importFrom User
    }
}
