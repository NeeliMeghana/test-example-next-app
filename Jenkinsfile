node {
    def app
    stage('Build') {
        echo 'Building application using Alpine image...'
        
        // Use the docker image inside this node block
        app = docker.image('node:14-alpine')
        app.pull() // Pull the image if it doesn't exist locally

        // Run inside the docker container
        app.inside('-p 3000:3000') {
            stage('Install Dependencies') {
                echo 'Installing dependencies...'
                sh 'npm install > build_logs/output.log 2>&1'
            }
            
            stage('Run Application') {
                echo 'Running the application on port 3000...'
                sh 'npm start >> build_logs/output.log 2>&1'
            }
        }
    }

    stage('Archive Logs') {
        echo 'Archiving logs...'
        archiveArtifacts artifacts: 'build_logs/output.log', allowEmptyArchive: true
    }
}
