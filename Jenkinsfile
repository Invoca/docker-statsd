#!/usr/bin/groovy
@Library('jenkins-pipeline@v0.3.0')
import com.invoca.docker.*;

pipeline {
  agent { label 'docker' }
  stages {
    stage('Setup') {
      environment {
        DOCKERHUB_USER = credentials('dockerhub_user')
        DOCKERHUB_PASSWORD = credentials('dockerhub_password')
      }
      steps {
        script {
          new Docker().hubLogin(env.DOCKERHUB_USER, env.DOCKERHUB_PASSWORD)

          def image_name = 'invocaops/statsd'
          def tags = [env.GIT_COMMIT, env.GIT_BRANCH]
          image = new Image(this, image_name, tags)
        }
      }
    }

    stage('Build') {
      environment { GITHUB_KEY = credentials('github_key') }
      steps {
        script {
          def args = ["SSH_KEY":env.GITHUB_KEY, "GIT_SHA":env.GIT_COMMIT]
          image.build(gitUrl: env.GIT_URL, buildArgs: args).tag()
        }
      }
    }

    stage('Push') {
      steps {
        script { image.push() }
      }
    }
  }

  post {
    always {
      deleteDir()
      notifySlack(currentBuild.result)
    }
  }
}
