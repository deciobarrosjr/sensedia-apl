####################################################################################################
#                                 RECOVERING REMOTE STATE DATA
####################################################################################################

data "terraform_remote_state" "l0-vpc" {
  backend = "s3"

  config = {
    bucket = "terraform-state-files-dbj"
    key    = "sensedia/l0-vpc.tfstate"
    region = var.region
  }
}

data "terraform_remote_state" "l1-eks" {
  backend = "s3"

  config = {
    bucket = "terraform-state-files-dbj"
    key    = "sensedia/l1-eks.tfstate"
    region = var.region
  }
}

data "terraform_remote_state" "l2-irsa" {
  backend = "s3"

  config = {
    bucket = "terraform-state-files-dbj"
    key    = "sensedia/l2-irsa.tfstate"
    region = var.region
  }
}


####################################################################################################
#                                 REQUSTING CLUSTER AUTHORIZATION DATA
####################################################################################################

data "aws_eks_cluster" "my-aws-cluster" { 
  depends_on = [ data.terraform_remote_state.l1-eks ]                                              
  name       = data.terraform_remote_state.l1-eks.outputs.eks-name
}

data "aws_eks_cluster_auth" "my-aws-cluster-auth" {                                                 
  depends_on = [ data.aws_eks_cluster.my-aws-cluster ]                                              
  name       = data.terraform_remote_state.l1-eks.outputs.eks-name
}


####################################################################################################
#                                 REQUESTING ECR AUTHORIZATION TOKEN
####################################################################################################

#data "aws_caller_identity" "current" {}

#data "aws_ecr_authorization_token" "token" {}


####################################################################################################
#                                 INSTALLING THE APPLICATIONS 
####################################################################################################

resource "helm_release" "my-apl-clusterip" {

 depends_on = [ data.terraform_remote_state.l2-irsa, data.terraform_remote_state.l1-eks ]

  name                = var.hlm-chart-name-1
  repository          = var.hlm-chart-repository
 # repository_username = data.aws_ecr_authorization_token.token.user_name
 # repository_password = data.aws_ecr_authorization_token.token.password
  chart               = var.hlm-chart-chart
  version             = var.hlm-chart-version
  namespace           = var.apl-namespace
  create_namespace    = false 

  #     ENNVIRONMENT VARIABLE WITH THE SERVICE TYPE THAT WILL BE RETURNED BY THE APPLICATION     #
  set {
    name  = "deployment.env[0].name"
    value = "HELLO_SVC_TYPE"
  }
  set {
    name  = "deployment.env[0].value"
    value = "ClusterIP"
  }

  #     The values.yaml definition     #

  set {
    name  = "AppImage"
    type  = "string"    
    value = var.App-Image
  }
  set {
    name  = "AplName"
    type  = "string"    
    value = var.apl-name-1
  }  
  set {
    name  = "svcType"
    type  = "string"    
    value = var.svcType-1
  }
  set {
    name  = "service.AlbScheme"
    type  = "string"    
    value = var.AlbScheme-1
  }     
  set {
    name  = "containerPort"
    type  = "auto"    
    value = var.containerPort-1
  }
  set {
    name  = "Port"
    type  = "auto"    
    value = var.Port-1
  }  
  set {
    name  = "replicaCount"
    type  = "auto"    
    value = 1
  }
}

resource "helm_release" "my-apl-loadbalancer" {

 depends_on = [ data.terraform_remote_state.l2-irsa, data.terraform_remote_state.l1-eks ]

  name                = var.hlm-chart-name-2
  repository          = var.hlm-chart-repository
  #repository_username = data.aws_ecr_authorization_token.token.user_name
  #repository_password = data.aws_ecr_authorization_token.token.password
  chart               = var.hlm-chart-chart
  version             = var.hlm-chart-version
  namespace           = var.apl-namespace
  create_namespace    = false 

  #     ENNVIRONMENT VARIABLE WITH THE SERVICE TYPE THAT WILL BE RETURNED BY THE APPLICATION     #
  set {
    name  = "deployment.env[0].name"
    value = "HELLO_SVC_TYPE"
  }
  set {
    name  = "deployment.env[0].value"
    value = "LoadBalancer"
  }

  #     The values.yaml definition     #

  set {
    name  = "AppImage"
    type  = "string"    
    value = var.App-Image
  }
  set {
    name  = "AplName"
    type  = "string"    
    value = var.apl-name-2
  }  
  set {
    name  = "svcType"
    type  = "string"    
    value = var.svcType-2
  }  
  set {
    name  = "service.AlbScheme"
    type  = "string"    
    value = var.AlbScheme-2
  } 
  set {
    name  = "containerPort"
    type  = "auto"    
    value = var.containerPort-2
  }
  set {
    name  = "Port"
    type  = "auto"    
    value = var.Port-2
  }  
  set {
    name  = "replicaCount"
    type  = "auto"    
    value = 1
  }

}

resource "helm_release" "my-apl-nodeport" {

 depends_on = [ data.terraform_remote_state.l2-irsa, data.terraform_remote_state.l1-eks ]

  name                = var.hlm-chart-name-3
  repository          = var.hlm-chart-repository
  #repository_username = data.aws_ecr_authorization_token.token.user_name
  #repository_password = data.aws_ecr_authorization_token.token.password
  chart               = var.hlm-chart-chart
  version             = var.hlm-chart-version
  namespace           = var.apl-namespace
  create_namespace    = false 

  #     ENNVIRONMENT VARIABLE WITH THE SERVICE TYPE THAT WILL BE RETURNED BY THE APPLICATION     #
  set {
    name  = "deployment.env[0].name"
    value = "HELLO_SVC_TYPE"
  }
  set {
    name  = "deployment.env[0].value"
    value = "NodePort"
  }

  #     The values.yaml definition     #

  set {
    name  = "AppImage"
    type  = "string"    
    value = var.App-Image
  }
  set {
    name  = "AplName"
    type  = "string"    
    value = var.apl-name-3
  }  
  set {
    name  = "svcType"
    type  = "string"    
    value = var.svcType-3
  } 
  set {
    name  = "service.AlbScheme"
    type  = "string"    
    value = var.AlbScheme-3
  }     
  set {
    name  = "containerPort"
    type  = "auto"    
    value = var.containerPort-3
  }
  set {
    name  = "Port"
    type  = "auto"    
    value = var.Port-3
  }  
  set {
    name  = "NodePort"
    type  = "auto"    
    value = var.NodePort-3
  }
  set {
    name  = "replicaCount"
    type  = "auto"    
    value = 1
  }
}


#####     PRINT WARNING MESSAGE TO WAIT SOME MINUTES BEFORE TESTING     #####

output "warning" {
  depends_on = [ helm_release.my-apl-nodeport ]
  
  value = "Wait some minutes before testing the application until the Load Balancer is provisioned."
}