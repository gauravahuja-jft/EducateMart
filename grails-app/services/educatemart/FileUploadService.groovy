package educatemart

import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile

@Transactional
class FileUploadService {

/*
    boolean transactional = true
*/

    def String uploadFile(MultipartFile file, String name, String destinationDir) {


/*
        def servletContext = ServletContextHolder.servletContext
*/
        /*     def storagePath = servletContext.getRealPath(destinationDirectory)*/
        def storagePath = "/opt/EducateMart/images/" + destinationDir
        // Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }

        // Store file
        if (!file.isEmpty()) {
            String extension = file.getOriginalFilename().split("\\.")[1];
            name = name + "." + extension
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            return "${storagePath}/${name}"

        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }
}