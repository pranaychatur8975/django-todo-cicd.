pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/pranaychatur8975/django-todo-cicd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t todo-app .'
            }
        }

        stage('Remove Old Container') {
            steps {
                sh '''
                    if [ $(sudo docker ps -q --filter "name=todo-app") ]; then
                        sudo docker stop todo-app
                        sudo docker rm todo-app
                    fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh 'sudo docker run -d --name todo-app -p 8000:8000 todo-app'
            }
        }
    }
}
