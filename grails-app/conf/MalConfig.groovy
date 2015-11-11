import org.apache.log4j.Level

// log4j configuration
log4j.external = {

    appenders {
       String logDir = grails.util.Environment.warDeployed ?
                       System.getProperty('catalina.home') + '/temp' :
                       'target'

      rollingFile name: 'stacktrace',
               maximumFileSize: 10 * 1024 * 1024,
               file: '$logDir/stacktrace.log',
               layout: pattern( conversionPattern: "%d [%t] %-5p %c{2} %x - %m%n"),
               maxBackupIndex: 10

		environmments {
			production {
		        appender new org.apache.log4j.net.SocketAppender(name:'central',
        	        layout:pattern(conversionPattern:'%d{ISO8601} %-5p %c{2} %x [%X{user}][%X{ip}] - %m%n'), threshold: Level.INFO,
            	    remoteHost: 'op.itds.ch', port: 4560, application:grails.util.Metadata.current.'app.name', reconnectionDelay: 10000,locationInfo:false)
			}
		}
    }




    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'


    environments {
        development {
            debug   true
            debug  'grails.app.services.ch.itds',
                    'grails.app.filters.ch.itds',
                    'grails.app.controllers.ch.itds',
                    'grails.app.domain.ch.itds',
                    'grails.app.jobs.ch.itds',
                    'grails.app.taglibs.ch.itds',
					'ch.itds'
        }
        production {
            warn stdout: ['grails.app.services.ch.itds',
                          'grails.app.filters.ch.itds',
                          'grails.app.controllers.ch.itds',
                          'grails.app.domain.ch.itds',
                          'grails.app.taglibs.ch.itds',
                          'grails.app.jobs.ch.itds',
						  'ch.itds'],
                    central: ['grails.app.services.ch.itds',
                              'grails.app.filters.ch.itds',
                              'grails.app.controllers.ch.itds',
                              'grails.app.domain.ch.itds',
                              'grails.app.taglibs.ch.itds',
                              'grails.app.jobs.ch.itds',
							  'ch.itds']
        }
    }

}
