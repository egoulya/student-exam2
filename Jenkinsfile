pipeline {
    agent { label 'agent' }
    environment{
        DOCKERHUB_CREDENTIALS = credentials('7356e423-ca3a-4274-9d81-454f5b7508aa')
    }
    stages {
        stage('Pull') {
            steps {
                sh ' cd /opt/student-exam2 && git pull origin master '
            }
        }
        stage('Test') {
            steps {
                sh '''
                cd /opt/student-exam2
                . venv/bin/activate
                pip install -e '.[test]'
                coverage run -m pytest
                coverage report
                '''
            }
        }
        stage('Build') {
            steps {
                sh ' cd /opt/student-exam2 && docker build -t cicd_exam:webapp . '
            }
        }
        stage('LoginDH') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('PushDH') {
            steps {
                sh 'docker push herowithin/cicd_exam:webapp'
            }
        }
    }
}
