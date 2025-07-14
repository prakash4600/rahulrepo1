pipeline {
    agent any

    environment {
        AZ_CLIENT_ID       = credentials('azure-client-id')
        AZ_CLIENT_SECRET   = credentials('azure-client-secret')
        AZ_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        AZ_TENANT_ID       = credentials('azure-tenant-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/prakash4600/rahulrepo1.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan -var="client_id=$AZ_CLIENT_ID" \
                               -var="client_secret=$AZ_CLIENT_SECRET" \
                               -var="subscription_id=$AZ_SUBSCRIPTION_ID" \
                               -var="tenant_id=$AZ_TENANT_ID"
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve -var="client_id=$AZ_CLIENT_ID" \
                                                 -var="client_secret=$AZ_CLIENT_SECRET" \
                                                 -var="subscription_id=$AZ_SUBSCRIPTION_ID" \
                                                 -var="tenant_id=$AZ_TENANT_ID"
                '''
            }
        }
    }
}

