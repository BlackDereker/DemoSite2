pipeline {
    agent {
        docker {
            image 'alpine' 
        }
    }
    stages {
        stage('Build') {
            agent { 
                docker 'maven:3-alpine'
            } 
            steps {
                sh 'mvn -f src/pom.xml clean install'
            }
        }
        stage('Test') {
            steps {
                echo 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                deploy adapters: [tomcat7(path: '', url: 'http://localhost:8888')], contextPath: '/usr/local/tomcat/webapps', onFailure: false, war: '**/*.war'
            }
        }
    }
}