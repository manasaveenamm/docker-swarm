pipeline {
    agent any

    stages {
        // NOTE: Jenkins automatically clones your GitHub repo at the start 
        // when using "Pipeline from SCM", so a clone stage is not needed here!

        stage('Build & Push to Local Registry') {
            steps {
                // Builds the image using your host's Docker engine
                sh 'docker build -t 172.31.32.239:5000/webserver:latest .'
                
                // Pushes the image to your private registry
                sh 'docker push 172.31.32.239:5000/webserver:latest'
            }
        }

        stage('Rolling Update Service') {
            steps {
                // Tells Docker Swarm to pull the new image and perform a rolling update
                sh 'docker service update --image 172.31.32.239:5000/webserver:latest webserver'
            }
        }
    }
}
