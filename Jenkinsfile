pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                dir('src') {
                    sh 'docker build -t anji379/cartservice:v1 .'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-cred']) {
                    sh 'docker push anji379/cartservice:v1'
                }
            }
        }
    }
}
