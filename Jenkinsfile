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
        sh "docker build -t img1 ." 
      }
    }
     stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'scp -r -o StrictHostKeyChecking=no deployment.yaml service.yaml ubuntu@ip-172-31-19-13:/docker'
 
                sh 'ssh ubuntu@ip-172-31-19-13 minikube kubectl apply -f /docker/deployment.yaml'
                sh 'ssh ubuntu@ip-172-31-19-13 minikube kubectl apply -f /docker/service.yaml'
            }
        }
  }
}
