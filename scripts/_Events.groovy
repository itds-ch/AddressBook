import org.apache.commons.lang.SystemUtils

eventCompileStart = { msg ->
    def versionInfo = "unknown version"
    if ( SystemUtils.IS_OS_UNIX ) {

        def procV = "git rev-parse HEAD".execute()
        procV.waitFor()
        def procH = "hostname".execute()
        procH.waitFor()
        def now = new Date();
        def sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm")
        def buildhost = procH.in.text.replace("\n", "")
        def buildversion = procV.in.text.replace("\n", "")
        versionInfo = 'git revision ' + buildversion + ' build @ '+sdf.format(now)+' on '+buildhost


    }
    new FileOutputStream("grails-app/views/_version.gsp", false) << versionInfo
}
eventCreateWarStart = { warName, stagingDir ->
    def buildNumber = System.getenv('BUILD_NUMBER')

    if ( SystemUtils.IS_OS_UNIX ) {

        def procV = "git rev-parse HEAD".execute()
        procV.waitFor()
        def procH = "hostname".execute()
        procH.waitFor()
        def buildhost = procH.in.text.replace("\n", "")
        def buildversion = procV.in.text.replace("\n", "")



        if (buildNumber) {
            ant.propertyfile(file: "${stagingDir}/WEB-INF/classes/application.properties") {
                entry(key: 'build.number', value: buildNumber)
                entry(key: 'build.host', value: buildhost)
                entry(key: 'build.version', value: buildversion)
            }
        }

    }
}