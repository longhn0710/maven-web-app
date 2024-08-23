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
        
    }
    post {
        always {
            // Archive the .war file as an artifact, regardless of the build outcome
            archiveArtifacts artifacts: 'target/maven-web-app.war', allowEmptyArchive: true
            
            // Optionally, you can add additional steps here, like sending notifications or cleaning up.
            echo 'Build completed. Attempting to archive the .war file.'
        }
    }
}
