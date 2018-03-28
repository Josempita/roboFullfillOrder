node {
  def project = 'robofullfillorder'
  def appName = 'robofullfillorder'
  def feSvcName = "robofullfillorder"
  def imageTag = "ssabbour/fulfillorderack"
  def teamName = "ROBO-CLUSTERS"

  //-----Dev Env Vars----//
  def devMongoURL = "mongodb://robo-dev-cosmos-db:qLL3oTfiz9vrv8LbyD6Rld1kmDUbMwkSdhfVQgZXsTmQ9OmRXrhKHmADGpujz6sfUyVkMuJP9PoltOTNFb2bQQ==@robo-dev-cosmos-db.documents.azure.com:10255/?ssl=true&replicaSet=globaldb"
  //def devEventHubPath = "robo-dev-event-hub"
  //def devProcessEndpoint = "http://robofullfillorder.robo-dev:8080/v1/order/"
  
  //-----Prod Env Vars----//
  def prodMongoURL = "mongodb://robo-cosmos-db:EnEPexfG6ONZP4x2NvNimhGX3NQy1zuPid7kCPiKn6KkS1gXx3p5rErNgrlyvTXbLLfLdpENFAWd856pFxlEqg==@robo-cosmos-db.documents.azure.com:10255/?ssl=true&replicaSet=globaldb"
  //def prodEventHubPath = "robo-prod-event-hub"
  //def prodProcessEndpoint = "http://robofullfillorder.robo-prod:8080/v1/order/"

  checkout scm

  stage "Deploy Application"
  
  sh("sed -i.bak 's#DOCKER-IMAGE#${imageTag}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#APP-NAME#${appName}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#SVC-NAME#${feSvcName}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#NAME-SPACE#${env.BRANCH_NAME}#' ./k8s/*.yaml")
  sh("sed -i.bak 's#TEAM-NAME#${teamName}#' ./k8s/*.yaml")
  
  switch (env.BRANCH_NAME) {
  // Roll out to dev
    case "robo-dev":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#MONGO-URL#${devMongoURL}#' ./k8s/*.yaml")
        //sh("sed -i.bak 's#EVENTHUB-PATH#${devEventHubPath}#' ./k8s/*.yaml")
        //sh("sed -i.bak 's#PROCESS-ENDPOINT#${devProcessEndpoint}#' ./k8s/*.yaml")
        sh("kubectl --kubeconfig=/var/kube/config --namespace=robo-dev apply -f k8s/")
            break
    // Roll out to production
    case "robo-prod":
        // Change deployed image in canary to the one we just built
        sh("sed -i.bak 's#MONGO-URL#${prodMongoURL}#' ./k8s/*.yaml")
        //sh("sed -i.bak 's#EVENTHUB-PATH#${prodEventHubPath}#' ./k8s/*.yaml")
        //sh("sed -i.bak 's#PROCESS-ENDPOINT#${prodProcessEndpoint}#' ./k8s/*.yaml")
        sh("kubectl --kubeconfig=/var/kube/config --namespace=robo-prod apply -f k8s/")
            break
    // Roll out a dev environment
    default:
        echo 'Leeroyyy JENKIIIIIIINNNNSSSSSS!!!!!!'
        
  }
}


