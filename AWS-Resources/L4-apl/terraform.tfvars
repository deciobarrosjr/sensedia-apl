# terraform.tfvars

###################################################################################
#                Variables: for each application being delivered                  #
###################################################################################

hlm-chart-name-1  = "my-apl-1"
apl-name-1        = "my-apl-clusterip"
svcType-1         = "ClusterIP" 
AlbScheme-1       = "internet-facing"
containerPort-1   = 8080
Port-1            = 80

hlm-chart-name-2  = "my-apl-2"
apl-name-2        = "my-apl-loadbalancer"
svcType-2         = "LoadBalancer"
AlbScheme-2       = "internet-facing"
containerPort-2   = 8080
Port-2            = 80

hlm-chart-name-3  = "my-apl-3"
apl-name-3        = "my-apl-nodeport"
svcType-3         = "NodePort" 
AlbScheme-3       = "internet-facing"
containerPort-3   = 8080
Port-3            = 80
NodePort-3        = 30000