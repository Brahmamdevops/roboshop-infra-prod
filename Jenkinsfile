pipeline {
    agent {
        node {
            label 'AGENT-1'  
        }
    }

    options {
        ansiColor('xterm')
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    //     parameters {
    //     string(name: 'version', defaultValue: '', description: 'Who should I say hello to?')
    //     string(name: 'environment', defaultValue: '', description: 'Who should I say hello to?')
       
    // }
    stages {
        stage('VPC') {
            steps {
                sh """
                    cd 01-vpc
                       terraform init
                       terraform apply -auto-approve
                """
            }
        }

        stage('SG') {
            steps {
                sh """
                    cd 02-sg
                       terraform init
                       terraform apply -auto-approve
                """
            }
        }
         stage('VPN') {
            steps {
                sh """
                   cd 03-vpn
                       terraform init
                       terraform apply -auto-approve

                """
            }
        }

        stage('DB ALB') {
            parallel {
                stage('DB') {
                    steps {
                        sh """
                           cd 04-databases
                              terraform init
                              terraform apply -auto-approve
                        """
                    }
                }

                stage('ALB') {
                    steps {
                        sh """
                           cd 05-app-alb
                              terraform init
                              terraform apply -auto-approve

                        """
                    }
                }

            }
        }
    
    
    }
    
    //post build
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()
        }
        failure { 
            echo 'this runs when pipeline is failed, used generally to send some alerts'
        }
        success{
            echo 'I will say Hello when pipeline is success'
        }
    }

}