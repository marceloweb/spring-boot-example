node {
   def commit_id
   def to = emailextrecipients([
          [$class: 'CulpritsRecipientProvider'],
          [$class: 'DevelopersRecipientProvider'],
          [$class: 'RequesterRecipientProvider']
  ])

  try {
      stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
      }
      stage('test') {
        sh './mvnw test && ./mvnw package'        
      }
      stage('docker build/push') {            
        docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
          def app = docker.build("marceloweb/spring-boot-demo:${commit_id}", '.').push()
        }                                     
      }
    } catch(e) {
       // mark build as failed
       currentBuild.result = "FAILURE";
       // set variables
       def subject = "${env.JOB_NAME} - Build #${env.BUILD_NUMBER} ${currentBuild.result}"
       def content = '${JELLY_SCRIPT,template="html"}'

       // send email
       if(to != null && !to.isEmpty()) {
         emailext(body: content, mimeType: 'text/html',
            replyTo: '$DEFAULT_REPLYTO', subject: subject,
            to: to, attachLog: true )
       }  

       slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

       // mark current build as a failure and throw the error
    throw e;
   }                                     
}                                          
