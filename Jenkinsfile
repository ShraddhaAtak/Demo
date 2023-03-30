pipeline {
  agent any
  environment {
      PATH="/opt/anaconda/bin/conda:$PATH"
  }
  stages {  
    stage('Build')
    {
      steps {
        echo "deploying the application"    
        sh "docker build -t shraddhapa/demo22:latest ." 
      }
    }
    stage('Push') {
            steps {
                echo 'Pushing image..'
                sh 'echo docker login -u shraddhapa --password-Kalyani@95'
                sh 'docker push shraddhapa/demo22:latest'
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
