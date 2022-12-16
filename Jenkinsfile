pipeline {
    agent any
    environment {
        PROJECT_ID = 'oss-363013'
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
                        myapp.push("latest")
                        }
                }
            }
        stage('Deploy to GKE') {
            steps{
                sh "sed -i 's/oss_server:latest/oss_server:${env.BUILD_ID}/g' deployment.yaml"
                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
            }
        }
        }
    }
}