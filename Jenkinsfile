pipeline
{
 agent any
  tools
  {
     maven 'maven-3.5.0'
  }
  triggers
  {
     pollSCM '* * * * *'
   }
  environment
  {
     REGISTRY="kalpanadodla/service-registry"
     DOCKER_HUB_LOGIN= credentials('docker-hub')
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

         steps {
              sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
              sh 'docker build -t $REGISTRY:${BUILD_NUMBER} .'
         }
        }
     stage('push-docker-image')
     {
         steps
          {
              sh 'docker push $REGISTRY:${BUILD_NUMBER}'
          }
     }
     stage('run-docker-image')
      {
          steps
           {
               sh 'docker pull $REGISTRY:${BUILD_NUMBER}'
               sh 'docker container run -d -p 8761:8761 $REGISTRY:${BUILD_NUMBER}'
           }
      }
   }
 }