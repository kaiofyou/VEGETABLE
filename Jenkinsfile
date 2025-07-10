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
	}
}
