pipeline {
    agent any

    stages {
        stage('Build & Push to Local Registry') {
            steps {
                sh 'docker build -t 172.31.32.239:5000/webserver:latest .'
                sh 'docker push 172.31.32.239:5000/webserver:latest'
            }
        }

        stage('Rolling Update Service') {
            steps {
                // The --detach=true flag prevents Jenkins from looping/hanging
                sh 'docker service update --detach=true --image 172.31.32.239:5000/webserver:latest webserver'
            }
        }
    }
}
