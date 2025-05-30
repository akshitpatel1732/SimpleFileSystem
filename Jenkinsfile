pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "filesystem-app"
    }

    stages {
        stage('Build') {
            steps {
                echo "Compiling the project using Makefile..."
                sh 'make clean && make'
            }
        }

        stage('Test') {
            steps {
                echo "Running unit tests..."
                sh 'make test'
            }
        }

        stage('Code Quality') {
            steps {
                echo "Running cppcheck analysis..."
                sh 'cppcheck --enable=all fileSystem.c || true'
            }
        }

        stage('Security') {
            steps {
                echo "Building Docker image and scanning for vulnerabilities..."
                sh 'docker build -t $DOCKER_IMAGE .'
                sh 'trivy image $DOCKER_IMAGE || true'
            }
        }

        stage('Deploy') {
            steps {
                echo "Running the application container interactively (demo mode)..."
                sh 'docker run -dit --name fsapp filesystem-app'
            }
        }

        stage('Release') {
            steps {
                echo "Tagging the release in Git..."
                sh '''
                git config --global user.email "akshitpatel1732@gmail.com"
                git config --global user.name "Akshit Patel"
                git tag -a v1.0 -m "First release"
                git push origin v1.0 || true
                '''
            }
        }

        stage('Monitoring') {
            steps {
                echo "Simulating basic monitoring..."
                sh 'docker logs fsapp || true'
            }
        }
    }

    post {
        always {
            echo "Cleaning up..."
            sh 'docker rm -f fsapp || true'
        }
    }
}
