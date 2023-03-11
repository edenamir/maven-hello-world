pipeline {
    agent any

        stage('Increment Version') {
            steps {
                script {
                    def version = readMavenPom().getVersion()
                    def parts = version.split("\\.")
                    int patch = parts[2].toInteger() + 1
                    String newVersion = "${parts[0]}.${parts[1]}.$patch"
                    bat "mvn versions:set -DnewVersion=${newVersion} -DgenerateBackupPoms=false"
                    bat "git commit -am \"Incremented version to ${newVersion}\""
                }
            }
        }

        stage('Compile Code') {
            steps {
                bat 'mvn compile'
            }
        }

        stage('Package Artifact') {
            steps {
                bat 'mvn package'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts 'target/*.jar'
            }
        }
    }

}
