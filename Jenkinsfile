pipeline {
    agent any

    environment {
        AZ_CLIENT_ID       = 'AZ_CLIENT_ID'
        AZ_CLIENT_SECRET   = '$AZ_CLIENT_SECRET'
        AZ_SUBSCRIPTION_ID = 'AZ_SUBSCRIPTION_ID'
        AZ_TENANT_ID       = 'AZ_TENANT_ID'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prakash4600/rahulrepo1.git'
            }
        }

        stage('Check Terraform') {
            steps {
                sh 'terraform -version'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh """
                    terraform plan \
                        -var="client_id=${AZ_CLIENT_ID}" \
                        -var="client_secret=${AZ_CLIENT_SECRET}" \
                        -var="subscription_id=${AZ_SUBSCRIPTION_ID}" \
                        -var="tenant_id=${AZ_TENANT_ID}"
                """
            }
        }

        stage('Terraform Apply') {
            steps {
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

    post {
        success {
            echo '✅ Terraform deployment completed successfully!'
        }
        failure {
            echo '❌ Terraform deployment failed. Please check the logs.'
        }
    }
}
