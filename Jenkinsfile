pipeline {
    agent any
    tools {
        maven 'maven-3.9.9'
    }
    stages {
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }

    stages {
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
    }
}

