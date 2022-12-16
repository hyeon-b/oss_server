pipeline {
    agent any
    environment {
        PROJECT_ID = 'oss-fall'
        CLUSTER_NAME = 'k8s'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("bibicsh22/oss_server:latest")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'shyeon') {
                        }
                }
            }
        }
    }
}