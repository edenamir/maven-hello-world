pipeline {
    agent any

    stages {
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
