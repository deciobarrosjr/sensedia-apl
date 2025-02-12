##### variables.tf

variable "region" {
  type        = string
  description = "The default region to create the resources."
}

variable "apl-namespace" {
  type        = string
  description = "The namespace in which the application will be deployed."
}


###################################################################################
#                      DOCKER IMAGE AND HELM CHART VARIABLES                      #
###################################################################################

variable "App-Image" {
  type        = string
  description = "The application image to deploy from ECR."
}

variable "hlm-chart-repository" {
  type        = string
  description = "The "
}

variable "hlm-chart-chart" {
  type        = string
  description = "The "
}

variable "hlm-chart-version" {
  type        = string
  description = "The "
}


###################################################################################
#                Variables: application service type ClusterIP                    #
###################################################################################

variable "hlm-chart-name-1" {
  type        = string
  description = "The "
}

variable "apl-name-1" {
  type        = string
  description = "The name of the application using the service type as ClusterIP."
}

variable "svcType-1" {
  type        = string
  description = "The service type for apl-namevou."
}

variable "AlbScheme-1" {
  type        = string
  description = "The service scheme for the Load Balance (internal or internet-facing)."
}

variable "containerPort-1" {
  type        = number
  description = "The port number for container."
}

variable "Port-1" {
  type        = number
  description = "The port number for accessing the container."
}


###################################################################################
#                Variables: application service type LoadBalancer                    #
###################################################################################

variable "hlm-chart-name-2" {
  type        = string
  description = "The "
}

variable "apl-name-2" {
  type        = string
  description = "The name of the application using the service type as ClusterIP."
}

variable "svcType-2" {
  type        = string
  description = "The service type for apl-name."
}

variable "AlbScheme-2" {
  type        = string
  description = "The service scheme for the Load Balance (internal or internet-facing)."
}

variable "containerPort-2" {
  type        = number
  description = "The port number for container."
}

variable "Port-2" {
  type        = number
  description = "The port number for accessing the container."
}


###################################################################################
#                Variables: application service type NodePort                    #
###################################################################################

variable "hlm-chart-name-3" {
  type        = string
  description = "The "
}

variable "apl-name-3" {
  type        = string
  description = "The name of the application using the service type as NodePort."
}

variable "svcType-3" {
  type        = string
  description = "The service type for apl-name."
}

variable "AlbScheme-3" {
  type        = string
  description = "The service scheme for the Load Balance (internal or internet-facing)."
}

variable "containerPort-3" {
  type        = number
  description = "The port number for container."
}

variable "Port-3" {
  type        = number
  description = "The port number for accessing the container."
}

variable "NodePort-3" {
  type        = number
  description = "The Node port number for accessing the container."
}