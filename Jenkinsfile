  
pipeline {
  environment {
    registry = "cleal200/serverjs"
    registryCredential = '17912e02-131e-46cd-9034-4081cf8f6fa8'
    dockerImage = ''
  }
  agent any
  stages {
      stage('Static Analysis') {
    environment {
        scannerHome = tool 'SonarQube'
    }
    steps {
        withSonarQubeEnv('SonarQube') {
            sh "${scannerHome}/bin/sonar-scanner"
        }
        timeout(time: 10, unit: 'MINUTES') {
            waitForQualityGate abortPipeline: true
        }
    }
}
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
    stage('Push Image to DockerHub') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Deploy Image to Production VM') {
      steps{
        sh 'ssh -t azureuser@13.70.7.22 kubectl set image deployments/serverjs serverjs=cleal200/serverjs:v2'
      }
      ]
  }
}
