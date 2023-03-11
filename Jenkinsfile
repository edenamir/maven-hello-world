pipeline {
    agent any

    stages {
            
            stage('Set version to 1.0.0') {
                steps {
                    bat 'mvn versions:set -DnewVersion=1.0.0'
                }
            }
            stage('Build') {
                steps {
                    bat 'mvn compile'
                }
            }
            stage('Package') {
                steps {
                    bat 'mvn package'
                }
            }
    }

}
