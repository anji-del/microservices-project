pipeline {
    agent any

    stages {
        stage('Clean') {
            steps {
                cleanWs()
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // If Dockerfile is inside ./src
                    sh 'docker build -t anji379/cartservice:v1 ./src'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'docker-cred', url: 'https://index.docker.io/v1/']) {
                        sh 'docker push anji379/cartservice:v1'
                    }
                }
            }
        }
    }
}
