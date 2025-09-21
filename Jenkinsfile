pipeline {
    agent any

    stages {
        stage('build') {
            steps {
                sh 'docker build -t anji379/frontendservice:v1 .'
            }
        }
        stage('push') {
            steps {
                script {
                     withDockerRegistry(credentialsId: 'docker-cred') {
                         sh 'docker push anji379/frontendservice:v1'
                     }
                }
            }
        }
    }
}
