pipeline {
    agent any

    stages {
        stage('Build & Push to Local Registry') {
            steps {
                sh 'docker build -t 172.31.45.104:5000/webserver:latest .'
                sh 'docker push 172.31.45.104:5000/webserver:latest'
            }
        }

        stage('Rolling Update Service') {
            steps {
                // --detach=true hands control back to Swarm instantly 
                // preventing Jenkins from hanging or looping
                sh 'docker service update --detach=true --image 172.31.45.104:5000/webserver:latest webserver'
            }
        }
    }
}
