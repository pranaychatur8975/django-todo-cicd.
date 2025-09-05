pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Pulling the source code from GitHub...'
                git branch: 'develop', url: 'https://github.com/pranaychatur8975/django-todo-cicd..git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build . -t todo-app'
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'
                sh 'docker run -p 8000:8000 -d todo-app'
            }
        }
    }
}
