pipeline {    
    agent any
    environment {
        PROJECT_ID = 'oss-363013'
        CLUSTER_NAME = 'k8s'
        LOCATION = 'asia-northeast3-a'
        CREDENTIALS_ID = 'gke'  //GithubApp을 통해 추가한 jenkins credential id
        BUILD_ID='0.2'
    }
    stages {
        stage("Build image") {
            steps {
                script {
                    myapp = docker.build("bibicsh22/oss_server:${env.BUILD_ID}")
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'shyeon') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }
   stage('Deploy to GKE') {
       steps{
      sh "sed -i 's/oss_server:latest/oss_server:${env.BUILD_ID}/g' Deployment.yaml"
      step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, 
      location: env.LOCATION, manifestPattern: 'Deployment.yaml', credentialsId: env.CREDENTIALS_ID])
       }
   }
    }
}