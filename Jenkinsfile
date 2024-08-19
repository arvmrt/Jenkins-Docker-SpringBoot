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
    }

    stages {
        stage('Test') {
            steps {
                withMaven {
                    sh "mvn test"
                    }
            }
        }
    }

    stages {
        stage('Build') {
            steps {
                withMaven {
                    sh "mvn package"
                    }
            }
        }
    }

}
