pipeline {
  agent any

  tools {
    nodejs 'node'
  }

      environment {
        IMAGE_NAME = 'snehakurve7/node-cicd-app'
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/snehabopche/node-cicd-app.git'
            }
        }


            stage('Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

            stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push $IMAGE_NAME
                    '''
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'kubectl apply -f k8s/'
            }
        }
    }
}

