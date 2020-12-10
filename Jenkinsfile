pipeline {
    agent { 
        docker {
            image: 'maven:3-jdk-8'
            reuseNode: true
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
                deploy adapters: [tomcat7(credentialsId: '0845e341-8d86-4415-890c-bd71040485e2', path: '', url: 'http://localhost:8080')], contextPath: '/usr/local/tomcat/webapps', onFailure: false, war: '**/*.war'
            }
        }
    }
}