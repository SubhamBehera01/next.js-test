pipeline {
    agent any

    environment {
        IMAGE_NAME = "nextjs-test"  
        AWS_REGION = "ap-south-1"
        AWS_ACCOUNT_ID = "130013148969"
        ECR_REPO = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git url: 'https://github.com/SubhamBehera01/nextjs-test.git', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${IMAGE_NAME} .'
                }
            }
        }

        stage('Clone Repo') {
    steps {
        git credentialsId: 'subham', url: 'https://github.com/SubhamBehera01/nextjs-test.git', branch: 'master'
    }
}

        stage('Tag and Push Image') {
            steps {
                script {
                    sh '''
                        docker tag ${IMAGE_NAME}:latest ${ECR_REPO}:latest
                        docker push ${ECR_REPO}:latest
                    '''
                }
            }
        }
    }
}