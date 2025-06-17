pipeline {
  agent any

  stages {
    stage ('checkout') {
      steps {
          git branch: 'main', url: 'https://github.com/chandu1861/project2.git'
      }
    }

    stage ('build') {
      steps {
          sh " docker build -t chandana1213/myimg01:latest ."
      }
    }

    stage ('container creation') {
      steps {
          sh " docker run -it -d --name c2 chandana1213/myimg01:latest /bin/bash"
      }
    }

     stage ('docker hub') {
      steps {  
         withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerpass', usernameVariable: 'dockeruser')]) {  
          sh "docker push chandana1213/myimg:latest"
         }
      }
    }

    stage ('kubernetes') {
      steps {
        script {
          withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'kubernetes', namespace: '', restrictKubeConfigAccess: false, serverUrl: '') { 
           kubectl delete pod --all
           kubectl apply -f deployment.yaml
           kubectl apply -f service.yaml
          }  
        }
      }
    }
  }
}
