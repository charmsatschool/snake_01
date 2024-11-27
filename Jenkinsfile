node('appserver_3120_60') {
    def app
 
    stage('Cloning Git') {
        checkout scm
    }
 
    stage('Build and Tag') {
        app = docker.build('charmsforschool/snake_01')
    }
 
    stage('SCA-SAST-SNYK-TEST') {
        snykSecurity(
            snykInstallation: 'Snyk',
            snykTokenId: 'Snykid',
            severity: 'critical'
        )
    }
     stage('SonarQube Analysis') {
        script {
            def scannerHome = tool 'SonarScanner'
            withSonarQubeEnv('SonarQube') {
                sh "${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=gameapp1 \
                    -Dsonar.sources=."
                    }
                }
            }
    stage('Post to DockerHub') {
        docker.withRegistry('https://registry.hub.docker.com', '3ff81ca6-e73e-4a5e-969b-1c7b652f2a12') {
            app.push('latest')
        }
    }
 
    stage('Deploy') {
        sh "docker-compose down"
        sh "docker-compose up -d"
    }
}
