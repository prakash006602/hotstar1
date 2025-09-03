pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/prakash006602/hotstar-website.git'
            }
        }
        stage('Build WAR with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t hotstar-tomcat .'
            }
        }
        stage('Deploy Container') {
            steps {
                sh '''
                docker rm -f hotstar || true
                docker run -d --name hotstar -p 8082:8080 hotstar-tomcat
                '''
            }
        }
    }
}

