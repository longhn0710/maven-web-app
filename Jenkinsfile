pipeline {
  
    agent {
        docker {
            image 'localhub.vn:5000/jdk17-maven3-9-1-docker-awscli:latest'  // Sử dụng hình ảnh Docker có cài đặt sẵn AWS CLI
            args '-v /var/run/docker.sock:/var/run/docker.sock --entrypoint=""' // Mount thư mục AWS credentials vào container
        }
    }
    
    stages {
        stage('Build') {
            steps {
               sh 'mvn clean package'
            }
        }
        
        stage('Create Image'){
            steps{
               steps {
                	script {
                		sh 'ansible-playbook task.yml'
                	}
                }
            }
        }
    }
}
