pipeline {
    agent any
    
    stages {
        stage('Set version') {
            steps {
                bat 'powershell -Command "(Get-Content pom.xml).replace(\'<version>.*</version>\', \'<version>1.0.1</version>\') | Set-Content pom.xml"'
            }
        }
        stage('Compile code') {
            steps {
                bat 'mvn compile'
            }
        }
        stage('Package artifact') {
            steps {
                bat 'mvn package'
            }
        }
        stage('Create artifact item') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}


