#need to create Jenkins declarative pipeline to ecr login & should be able to push to ecr

pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'your-account-id.dkr.ecr.us-east-1.amazonaws.com/your-repo-name'
        IMAGE_TAG = "webapp-${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "checkout scm"
                git "https://github.com/Chandan-3461/CCTech-devops-may-24.git"
            }
        }

        stage('ECR Login') {
            steps {
                script {
                    sh '''
                    aws ecr get-login-password --region $AWS_REGION | \
                    docker login --username AWS --password-stdin $ECR_REPO
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh '''
                    docker build -t $ECR_REPO:$IMAGE_TAG .
                    '''
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    sh '''
                    docker push $ECR_REPO:$IMAGE_TAG
                    '''
                }
            }
        }
    }
}
