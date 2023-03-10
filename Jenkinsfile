pipeline {
    agent any

        stage('Bump version') {
        steps {
            script {
                def pom = readMavenPom file: 'pom.xml'
                def version = pom.version
                def parts = version.tokenize('.')
                int patch = parts[2].toInteger() + 1
                def newVersion = "${parts[0]}.${parts[1]}.${patch}"
                sh "mvn versions:set -DnewVersion=${newVersion} -DgenerateBackupPoms=false"
            }
        }
    }

    stage('Compile and package') {
        steps {
            sh 'mvn compile'
            sh 'mvn package'
        }
    }

    stage('Create artifact') {
        steps {
            archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
        }
    }

}
