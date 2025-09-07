pipeline {
    agent any

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
                    if [ $(docker ps -aq -f name=todo-app) ]; then
                        docker stop todo-app || true
                        docker rm todo-app || true
                    fi
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                    docker run -d --name todo-app -p 8000:8000 todo-app sh -c "
                        python manage.py migrate --noinput &&
                        python manage.py runserver 0.0.0.0:8000
                    "
                '''
            }
        }
    }
}
