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
                sh 'scp -r -o StrictHostKeyChecking=no deployment.yaml service.yaml root@ip-172-31-38-249:/docker'
 
                sh 'ssh root@ip-172-31-38-249 kubectl apply -f /docker/deployment.yaml'
                sh 'ssh root@ip-172-31-38-249 kubectl apply -f /docker/service.yaml'
            }
        }
  }
}
