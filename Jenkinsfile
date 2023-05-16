pipeline {
  agent any
  parameters {
      string defaultValue: 'TEST', description: 'environment to deploy the application', name: 'ENV', trim: true
      choice choices: ['main', 'master'], description: 'environment to deploy the application', name: 'BRANCH'
  }
 environment {
         DEPLOY_BRANCH = "$BRANCH"
         DEPLOY_ENV = "$ENV"
      }
  stages {
    stage('BUILD') {
      steps {
        echo "Deploying to ${params.ENV}"
        echo "Code from ${params.BRANCH} branch"
        sh '''
              echo Deploying to ${BRANCH}
              echo Code from ${ENV} branch
              exit 0
           '''
      }
    }
  }
}

