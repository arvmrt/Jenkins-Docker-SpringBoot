pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
    }

    environment {
        // Define environment variables here
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_REPO = 'arvmrt'
        DOCKER_IMAGE = 'spring-boot-app'
        DOCKER_TAG = '1.0'
        MAVEN_HOME = '/usr/local/maven'
    }

    stages {

        stage('Build') {
            steps {
                withMaven {
                    sh "mvn clean package"
                    archiveArtifacts artifacts: '**/target/*.jar'
                    }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t arvmrt/spring-boot-sample:1.0 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker registry
                    withCredentials([usernamePassword(credentialsId: 'docker-cred3', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin ${DOCKER_REGISTRY}"
                    }
                    
                    // Push the Docker image to the registry
                    sh "docker push ${DOCKER_REGISTRY}/${DOCKER_REPO}/${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }


    }

    post {
        always {
            // Clean up workspace
            cleanWs()
        }

        success {
            echo 'Pipeline succeeded!'
        }

        failure {
            echo 'Pipeline failed!'
        }
    }


}

