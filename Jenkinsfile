env.BUILD = 'v0.1.' + env.BUILD_NUMBER
env.SERVICENAME = env.JOB_NAME.replaceFirst('.+/', '') + '-hello'
env.DOCKER_IMAGE_NAME = 'hello:latest'
env.DOCKER_REGISTRY_PUSH = 'mudigal-docker-sandbox.bintray.io'
env.CONTAINER1 = 'com/mudial/hello-deployment'
env.DOCKER_HOST = 'unix:///var/run/docker.sock'

node {
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'artifactory',
                    usernameVariable: 'artiUser', passwordVariable: 'artiPass']]) {
    stage 'build'
      // Checkout from GitHub
      checkout scm

      // Build the project via maven docker.
      sh 'sudo docker run --rm --name maven-dev -v "$PWD":/usr/src/hello-deployment -w /usr/src/hello-deployment maven:3.5.0-jdk-8-alpine mvn clean install'

      // Bintray User ID and API Key 
      sh 'sudo docker login -u ${artiUser} -p ${artiPass} ${DOCKER_REGISTRY_PUSH}'
      sh 'sudo docker build -t ${DOCKER_IMAGE_NAME} ${PWD}/target'

      sh 'sudo docker tag ${DOCKER_IMAGE_NAME} ${DOCKER_REGISTRY_PUSH}/${CONTAINER1}:${BUILD}'
      sh 'sudo docker tag ${DOCKER_IMAGE_NAME} ${DOCKER_REGISTRY_PUSH}/${CONTAINER1}:latest'

    stage 'push'

      sh 'sudo docker push ${DOCKER_REGISTRY_PUSH}/${CONTAINER1}:${BUILD}'
      sh 'sudo docker push ${DOCKER_REGISTRY_PUSH}/${CONTAINER1}:latest'

    stage 'promote'
    

    stage 'deploy'
      // Manually deploy using the below commands after logging in to Jenkins vagrant machine. (Continuous Delivery)
      
      // kubectl config set-context vagrant
      // kubectl create -f ${PWD}/src/main/k8s/hello-deployment.yaml --namespace=development
      // kubectl create -f ${PWD}/src/main/k8s/hello-service.yaml --namespace=development
    }
}
