pipeline{
    agent { label 'workstation' }
    parameters{
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select The Environment')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Select Apply or Destroy')
    }
    // options {
    //     ansiColor('xterm')    
    // }
    stages{
        stage("Terraform Init"){
            steps{
                sh "terraform init --backend-config=env-dev/dev-backend.tfvars"
            }    
        }
        stage("Terraform plan"){
            steps{
                sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars"
            }    
        }
        stage('Terraform Apply') {
            steps {
                sh "terraform ${ACTION} -var-file=env-${ENV}/${ENV}.tfvars -auto-approve "
            }
        }
    }

}