pipeline{
    agent { label 'workstation'}
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
                sh "terrafile -f env-${ENV}/terrafile"
                sh "terraform init --backend-config=env-${ENV}/${ENV}-backend.tfvars"
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