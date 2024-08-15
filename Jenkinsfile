pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
    }

    stages {
        stage('Clean') {
            steps {
                withMaven {
                    sh "mvn clean verify"
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

        stage('Build') {
            steps {
                withMaven {
                    sh "mvn package"
                    }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jdk-spring-boot .'
            }
        }

        stage('Build Docker Image2') {
            steps {
                sh 'mvn -DskipTests ' +
                    'clean package spring-boot:repackage ' +
                    'docker:build docker:push'
            }
        }


    }

}

