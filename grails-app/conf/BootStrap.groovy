import educatemart.*

class BootStrap {

    def stateslist=["Delhi","Noida","Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chandigarh",
                    "Chhattisgarh","Dadra and Nagar Haveli", "Daman and Diu","Goa","Gujarat",
                    "Haryana","Himachal Pradesh",
                    "Jammu and Kashmir","Jharkhand","Karnataka","Kerala",
                    "Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram",
                    "Nagaland","Odissa","Punjab","Rajasthan","Sikkim","Tamil Nadu",
                    "Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal",
                    "Andaman and Nicobar", "Lakshadweep","Puducherry" ]

    def facilitylist=["Library","Labs","Transportation","Cafeteria","Amphitheater","Medical"]
    def init = { servletContext ->

        for (String state:stateslist) {
            println 'Inserting State '+ state
            new State(name: state).save()
        }
        println 'Inserting Cities'
        new City(name: 'New Delhi',state: State.findByName('Delhi')).save()
        new City(name: 'Noida',state: State.findByName('Noida')).save()

        for (String facility:facilitylist) {
            println 'Inserting Facility '+ facility
            new Facility(facilityName: facility,facilityType: FacilityType.Default).save()
        }
        println 'Inserting dummy Custom Facilities'
        new Facility(facilityName: 'Skating Rink',facilityType: FacilityType.Custom).save()
        new Facility(facilityName: 'Sports',facilityType: FacilityType.Custom).save()
        new Facility(facilityName: 'Music Classes',facilityType: FacilityType.Custom).save()

        println 'Setting up spring security'
        def parentRole = Authority.findByAuthority('ROLE_PARENT') ?: new Authority(authority: 'ROLE_PARENT').save(failOnError: true)
        def adminRole = Authority.findByAuthority('ROLE_ADMIN') ?: new Authority(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            UserAuthority.create adminUser, adminRole
        }

        def parentUser = User.findByUsername('gaurav') ?: new User(
                username: 'gaurav',
                password: 'gaurav',
                enabled: true).save(failOnError: true)

        if (!parentUser.authorities.contains(parentRole)) {
            UserAuthority.create parentUser, parentRole
        }
    }
    def destroy = {
    }
}
