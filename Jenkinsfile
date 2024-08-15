pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
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

        stage('Test') {
            steps {
                withMaven {
                    sh "mvn test"
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
                sh 'docker push arvmrt/spring-boot-sample:1.0'
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

