pipeline {
    agent any

    stages {
        stage('Clone Source Code') {
            steps {
                echo 'Cloning source code...'
                git branch: 'main', url: 'https://github.com/kaiofyou/VEGETABLE.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t vegefoods .'
            }
        }

        stage('Remove Old Container') {
            steps {
                echo 'Removing old container if exists...'
                sh 'docker rm -f vegefoods-container || true'
            }
        }

        stage('Run New Container') {
            steps {
                echo 'Running new container...'
                sh 'docker run -d --name vegefoods-container -p 8080:80 vegefoods'
            }
        }
    }
}
