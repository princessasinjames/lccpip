terraform {

 required_providers {

   docker = {

     source = "kreuzwerker/docker"

     version = "~>3.0"

   }

 }

}


provider "docker" {}


resource "docker_image" "app" {

 name = "jenkins-demo:latest"

}


resource "docker_container" "app" {

 name = "jenkins-demo-container"

 image = docker_image.app.image_id


 ports {

   internal = 5000

   external = 5000

 }

}
