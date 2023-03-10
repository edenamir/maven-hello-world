pipeline {
    agent any

    stages {
            stage('Version Bump') {
                steps {
                    script {
                        def currentVersion = readMavenPom().getVersion()
                        def newVersion = currentVersion.tokenize('.').collect{ it.toInteger() }
                        newVersion[2]++
                        def newVersionString = newVersion.join('.')
                        sh "mvn versions:set -DnewVersion=${newVersionString} -DgenerateBackupPoms=false"
                    }
                }
            }
            stage('Build') {
                steps {
                    sh 'mvn compile'
                }
            }
            stage('Package') {
                steps {
                    sh 'mvn package'
                }
            }
            stage('Create Artifact') {
                steps {
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                }
            }
    }

}
