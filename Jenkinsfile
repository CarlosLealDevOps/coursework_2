pipeline{
    agent any
    stages{
        stage ('build'){
            steps{
                echo 'build'
            }
        }
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
        stage ('deploy'){
            steps{
                echo 'deploy'
            }
        }
    }
}

