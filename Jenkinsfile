pipeline {
    agent {label 'newdevops'} 
    stages {
        stage('My Build') { 
            steps {
              sh "echo ${BUILD_NUMBER}"
              sh 'mvn deploy'
              sh 'pwd'
              //sh 'scp -R /home/newdevops/workspace/build/target/hello-world-war-1.0.0.war ubuntu@172.31.5.38:/opt/tomcat/webapps/'
            }
        }
        stage('My deploy') { 
        agent {label 'newagent'}
            steps {
              sh 'curl -u kjsharath5@gmail.com:Sharath@123 -O https://sharathkj.jfrog.io/artifactory/libs-release-local/com/efsavage/hello-world-war/${BUILD_NUMBER}/hello-world-war-${BUILD_NUMBER}.war'
              sh 'sudo cp -R hello-world-war-${BUILD_NUMBER}.war /opt/tomcat/webapps/'
              sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
              sh 'sleep 2'
              sh 'sudo sh /opt/tomcat/bin/startup.sh'
            }
        }
    }
}
