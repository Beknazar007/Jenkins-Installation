pipeline {
    agent any
    
    stages {
        stage('Init and Plan') {
            steps {
                script {
                    withAWS(credentials: 'aws-for-demo-cred', region: 'us-east-1')  {
                        sh "terraform init -input=false"
                        sh "terraform plan -input=false -out=tfplan"
                        sh "terraform show -no-color tfplan > tfplan.txt"
                    }
                }
            }
        }

        stage('Apply') {
            steps {
                script {
                    input 'approve'
                    withAWS(credentials: 'aws-for-demo-cred', region: 'us-east-1')  {
                        sh "terraform apply -input=false tfplan"
                    }
                }
            }
        }
        
        stage('Destroy') {
            steps {
                input 'approve'
                script {
                    withAWS(credentials: 'aws-for-demo-cred', region: 'us-east-1')  {
                        sh "terraform destroy --auto-approve"
                    }
                }
            }
        }
    }
}
