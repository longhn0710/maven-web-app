pipeline {
  
    agent {
        docker {
            image 'localhub.vn:5000/jdk17-maven3-9-1-docker-awscli:latest'  // Sử dụng hình ảnh Docker có cài đặt sẵn AWS CLI
            args '-v /var/run/docker.sock:/var/run/docker.sock --entrypoint=""' // Mount thư mục AWS credentials vào container
        }
    }
    options {
        buildDiscarder(logRotator(daysToKeepStr: '5', artifactNumToKeepStr: '10'))
        disableConcurrentBuilds()
    }
    //triggers {
    //    cron('TZ=Asia/Ho_Chi_Minh\nH(00-05) 9 18-29 3 1-5')
    //}

    stages {
        stage('Getting build number') { 
            steps {
                script {        
                  def now = new Date()
                  build_version =  now.format("yyyy.MM.dd.HHmm", TimeZone.getTimeZone('GMT+7'))
                  currentBuild.displayName = "${build_version}"
                  env.buildVersion = "${build_version}"
                } 
            } 
        }
        stage('Build') {
            steps {
               sh 'mvn clean package'
            }
        }
        stage('Build Docker images') {
            steps {
               sh """
               docker build webapp .
               
               
               """
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
