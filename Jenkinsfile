pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh 'docker build -t anji379/service:v1 .'
            }
        }
        stage('push') {
            steps {
                script {
                     withDockerRegistry(credentialsId: 'docker-cred') {
                         sh 'docker push anji379/service:v1'
                     }
                }
            }
        }
    }
}
