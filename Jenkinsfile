node('appserver_3120_60') {
def app

stage('Cloning Git') {
    /* Lets make sure we have a repository to checkout SCM */
    checkout scm
}

stage('Build-and-Tag') {
    app = docker.build('charmsforschool/snake_01')
}

stage('SAST-SNYK'){
    echo "testing SNYK"
}

stage('Post-to-dockerhub') {
    docker.withRegistry('https://registry.hub.docker.com', '3ff81ca6-e73e-4a5e-969b-1c7b652f2a12') {
        app.push('latest')
    }
}

stage('Deploy') {
    sh "docker-compose down"
    sh "docker-compose up -d"
}
}
