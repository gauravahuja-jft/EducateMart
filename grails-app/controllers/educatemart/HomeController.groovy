package educatemart

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

@Secured('ROLE_PARENT')
class HomeController {
    def springSecurityService

    def index() {
        def schools = School.list()
        def reviews = Review.findAllByModerated(Boolean.TRUE,[max: 3])//////////TODO: orderby date created
        render(view: "index", model: [schools: School.list(max: 3), reviews: reviews])
        //schoolsJSON: JSON.use("deep") { schools as JSON },
    }

    def viewSchool() {
        School school = School.findById(params?.id)
        render(view: 'viewSchool', model: [school: school])
    }

    def landingSearch() {
        def schoolName = params?.autocompleteState
        School school = School.findBySchoolName(schoolName)
        render(view: 'viewSchool', model: [school: school])
    }

    def ajaxSchoolFinder = {
        def schoolsFound = School.withCriteria {
            ilike 'schoolName', params.term + '%'
        }
        render(schoolsFound.schoolName as JSON)
    }

    def getImage() {
        def path = params.filepath
        //returns an image to display
        BufferedImage originalImage = ImageIO.read(new File(path));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        def fileext = path.substring(path.indexOf(".") + 1, path.length())

        ImageIO.write(originalImage, fileext, baos);
        baos.flush();

        byte[] img = baos.toByteArray();
        baos.close();
        response.setHeader('Content-length', img.length.toString())
        response.contentType = "image/" + fileext // or the appropriate image content type
        response.outputStream << img
        response.outputStream.flush()
    }

    def writeReview() {
        def schoolId = params?.schoolId
        def schoolReview = params?.schoolReview
        School school = School.findById(schoolId)
        User currentUser = springSecurityService.currentUser
        Review review = new Review(text: schoolReview, user: currentUser)
        review.setSchool(school)
        review.save()
        school.addToReview(review: review)
        school.save()
        redirect(action: 'viewSchool',params: ['id':schoolId])
    }

}