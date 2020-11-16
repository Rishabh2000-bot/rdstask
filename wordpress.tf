resource "null_resource" "kubernetes_start" {
provisioner "local-exec" {
command = "minikube start"
}
}
provider "kubernetes" {
config_context_cluster = "minikube"
}
resource "kubernetes_deployment" "wordpress" {
metadata {
name = "risword"
}
spec {
replicas = 3
selector {
match_labels = {
env    = "production"
region = "IN"
App    = "wordpress"
}
match_expressions {
key      = "env"
operator = "In"
values   = ["production", "webserver"]
}
}
template {
metadata {
labels = {
env    = "production"
region = "IN"
App    = "wordpress"
}
}
spec {
container {
image = "wordpress:4.8-apache"
name  = "risword"
}
}
}
}
}
resource "kubernetes_service" "wordnode" {
metadata {
name = "wordnode"
}
spec {
selector = {
app = "wordpress"
}
port {
protocol    = "TCP"
port        = 80
target_port = 80
}
type = "NodePort"
}
}
