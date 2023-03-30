pipeline {
    agent any
    
    environment {
        DOCKER_HUB_REPO = "shraddhapa/demo22"
        CONTAINER_NAME = "demo22"
        DOCKERHUB_CREDENTIALS=credentials('dockerhub-credentials')
    }
    
    stages {
        /* We do not need a stage for checkout here since it is done by default when using "Pipeline script from SCM" option. */
        
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker image build -t $DOCKER_HUB_REPO:latest .'
            }
        }
        
        stage('Push') {
            steps {
                echo 'Pushing image..'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push $DOCKER_HUB_REPO:latest'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'scp -r -o StrictHostKeyChecking=no deployment.yaml service.yaml ubuntu@ip-172-31-19-13:/docker'
 
                sh 'ssh ubuntu@ip-172-31-19-13 kubectl apply -f /docker/deployment.yaml'
                sh 'ssh ubuntu@ip-172-31-19-13 kubectl apply -f /docker/service.yaml'
            }
        }
    }
}

