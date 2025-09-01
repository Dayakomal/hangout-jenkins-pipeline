pipeline {
  agent any
  options { timestamps() }

  stages {
    stage('Checkout') {
      steps { checkout scm }
    }

    stage('Build Image') {
      steps {
        sh 'docker version'
        sh 'docker build -t hangout-image:$BUILD_NUMBER .'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'docker run --rm hangout-image:$BUILD_NUMBER | tee test-output.txt'
      }
    }

    stage('Teardown') {
      steps {
        sh 'docker image rm hangout-image:$BUILD_NUMBER || true'
      }
    }
  }

  post {
    always {
      archiveArtifacts artifacts: 'test-output.txt', onlyIfSuccessful: false
    }
  }
}

