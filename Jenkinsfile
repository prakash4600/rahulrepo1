pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/prakash4600/rahulrepo1.git'
            }
        }

        stage('Terraform Init & Plan') {
            steps {
                dir('terraform') {
                    withCredentials([
                        string(credentialsId: 'AZURE_CLIENT_ID', variable: 'AZ_CLIENT_ID'),
                        string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'AZ_CLIENT_SECRET'),
                        string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'AZ_SUBSCRIPTION_ID'),
                        string(credentialsId: 'AZURE_TENANT_ID', variable: 'AZ_TENANT_ID')
                    ]) {
                        sh 'terraform init'
                        sh """
                            terraform plan \
                              -var="client_id=${AZ_CLIENT_ID}" \
                              -var="client_secret=${AZ_CLIENT_SECRET}" \
                              -var="subscription_id=${AZ_SUBSCRIPTION_ID}" \
                              -var="tenant_id=${AZ_TENANT_ID}"
                        """
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    withCredentials([
                        string(credentialsId: 'AZURE_CLIENT_ID', variable: 'AZ_CLIENT_ID'),
                        string(credentialsId: 'AZURE_CLIENT_SECRET', variable: 'AZ_CLIENT_SECRET'),
                        string(credentialsId: 'AZURE_SUBSCRIPTION_ID', variable: 'AZ_SUBSCRIPTION_ID'),
                        string(credentialsId: 'AZURE_TENANT_ID', variable: 'AZ_TENANT_ID')
                    ]) {
                        sh """
                            terraform apply -auto-approve \
                              -var="client_id=${AZ_CLIENT_ID}" \
                              -var="client_secret=${AZ_CLIENT_SECRET}" \
                              -var="subscription_id=${AZ_SUBSCRIPTION_ID}" \
                              -var="tenant_id=${AZ_TENANT_ID}"
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Terraform deployment completed successfully!'
        }
        failure {
            echo '❌ Terraform deployment failed. Please check the logs.'
        }
    }
}
