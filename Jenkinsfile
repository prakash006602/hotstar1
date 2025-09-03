pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t myapp:v1 .'
            }
        }
        stage('Run Container (Local Test)') {
            steps {
                script {
                    // Stop & remove old container if exists
                    sh 'docker rm -f myapp-cont || true'         
                    sh 'docker run -d --name myapp-cont -p 8082:8080 myapp:v1'
                }
            }
        }
        stage('Check Container Logs') {
            steps {
                sh 'docker ps -a | grep myapp-cont'
                sh 'docker logs myapp-cont || true'
            }
        }
        stage('Deploy to Docker Swarm') {
            steps {
                script {
                    // Create/Update Swarm service
                    sh '''
                    docker service rm myapp-service || true
                    docker service create \
                        --name myapp-service \
                        --publish 8082:8080 \
                        --replicas 5 \
                        myapp:v1
                    '''
                }
            }
        }
    }
}
