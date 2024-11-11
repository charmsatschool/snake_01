node('appserver_3120_60') {
    def app
 
    stage('Cloning Git') {
        checkout scm
    }
 
    stage('Build and Tag') {
        app = docker.build('abe6191990/snakegame1')
    }
 
    stage('SCA-SAST-SNYK-TEST') {
        snykSecurity(
            snykInstallation: 'Snyk',
            snykTokenId: 'Snykid',
            severity: 'critical'
        )
    }
 
    stage('Post to DockerHub') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub_credentials') {
            app.push('latest')
        }
    }
 
    stage('Deploy') {
        sh "docker-compose down"
        sh "docker-compose up -d"
    }
}
