pipeline
{
 agent any
    tools{
        maven 'maven-3.5.0'
    }
  triggers {
     pollSCM '* * * * *'
   }
     stages
     {
         stage('check-out')
         {
             steps
             {
               git 'https://github.com/kalpanadodla/service-registry.git'
             }
         }
       stage('build')
       {
           steps
           {
             sh 'mvn clean install -DskipTests'
           }
       }
     stage('build-docker-image')
      {
        environment{
               DOCKER_HUB_LOGIN= credentials('docker-hub')
              }
         steps {
              sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
              sh 'docker build -t kalpanadodla/service-registry:${BUILD_NUMBER} .'
         }
        }
     stage('push-docker-image')
     {
         steps
          {
              sh 'docker push kalpanadodla/service-registry:${BUILD_NUMBER}'
          }
     }
}
}