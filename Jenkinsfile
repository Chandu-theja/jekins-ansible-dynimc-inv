

pipeline {
  agent { 
  label 'ansible'
  }
  environment {
   AWS_EC2_PRIVATE_KEY=credentials('ec2-private-key') 
  }
  
  stages {
    
    //Get the Code from GitHub Repo
    stage('CheckOutCode'){
      steps{
        git branch: 'master', credentialsId: '9fa824d8-6797-46a8-93e7-2761fcb49d98', url: 'https://github.com/Chandu-theja/jekins-ansible-dynimc-inv.git'
      }
    }
     
    // Set AWS Credentials
    stage('aws-credentials') {
      steps {
        script {
          withCredentials([string(credentialsId: 'aws-access', variable: 'AWS_ACCESS_KEY_ID'), string(credentialsId: 'aws-secret', variable: 'AWS_SECRET_ACCESS_KEY')]) {
          // Credentials will be available as environment variables
         }
      }
      }
    }
    stage('CreateServers'){
      steps{
       sh "terraform  -chdir=terraformscripts init"
       sh "terraform  -chdir=terraformscripts apply --auto-approve"
      }
    }
    
    //Run the playbook
    stage('RunPlaybook') {
      steps {
        sh "whoami"
        //List the dymaic inventory just for verification
        //sh "ansible-inventory --graph -i inventory/aws_ec2.yaml"
        //Run playbook using dynamic inventory & limit exuection only fo tomcatservers.
        sh "ansible-playbook -i inventory/aws_ec2.yaml  playbooks/installTomcat.yml -u ec2-user --private-key=$AWS_EC2_PRIVATE_KEY --limit tomcatservers --ssh-common-args='-o StrictHostKeyChecking=no'"
      }
    }
    
  }//stages closing
}//pipeline closing
