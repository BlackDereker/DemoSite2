pipeline {
    agent { 
        docker {
            image 'maven:3-jdk-8'
            reuseNode true
        }
    } 
    stages {
        stage('Build') {
            steps {
                sh 'mvn -f src/pom.xml clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'mvn -f src/pom.xml test'
            }
        }
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat7(credentialsId: 'admin', path: '/manager', url: 'http://localhost:8080')], contextPath: 'demosite', onFailure: false, war: '**/*.war'
            }
        }
    }
}