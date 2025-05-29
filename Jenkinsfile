pipeline {
    agent any

    environment {
        IMAGE_NAME = "nextjs-test"
        AWS_REGION = "ap-south-1"
        ECR_REPO = "130013148969.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}"
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                git credentialsId: 'subham', url: 'https://github.com/SubhamBehera01/next.js-test.git', branch: 'master'
            }
        }
        
        stage('Logging into AWS ECR') {
            steps {
                script {
                    sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin 130013148969.dkr.ecr.${AWS_REGION}.amazonaws.com"
                }
            }
        }

        stage('Build Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    sh """
                        docker tag ${IMAGE_NAME}:latest ${ECR_REPO}:latest
                        docker push ${ECR_REPO}:latest
                    """
                }
            }
        }
    }
}
