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
  }
}
