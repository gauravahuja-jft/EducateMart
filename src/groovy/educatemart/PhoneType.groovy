package educatemart

/**
 * Created by gaurav on 15/3/16.
 */
enum PhoneType {

        OFFICE('Office', 'O'), MOBILE('Mobile', 'M'), FAX('Fax', 'F')

        String id
        String name

        PhoneType(String name, String id) {
            this.name = name
            this.id = id
        }

}