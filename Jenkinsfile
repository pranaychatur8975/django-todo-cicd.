pipeline {
    agent any

    triggers {
        // Every 5 minutes check for changes
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'develop',
                    url: 'https://github.com/pranaychatur8975/django-todo-cicd..git',
                    credentialsId: '11480d13-4196-4e20-adbc-e8a66d7b0d52'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t todo-app .'
            }
        }

        stage('Remove Old Container') {
            steps {
                sh '''
                    if [ $(docker ps -q --filter "name=todo-app") ]; then
                        docker stop todo-app
                        docker rm todo-app
                    fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -p 8000:8000 -d todo-app'
            }
        }
    }
}
