railsapp-k8s
===============

INTRODUCTION
---

Dockerize ruby and rails app , publish and scale with K8s

Lab Environment
---

* CentOS Linux release 7.6.1810
* Docker version 1.13.1
* Docker-compose 1.23.2
* Minikube v0.35.0
    * Kubernetes 1.14.1
    * docker 17.09.0-ce
* virtualbox v5.2


Create New Rails app with postgres database:
---

* type this command to do that :
```
rails new app-name --database=postgresql
```


Usage
---

* To run this example, you'll need to have a kubernetes cluster up: 
1 - First, start the cluster by running
```
minikube start
```

2 - Then, run the 
```
k8s/up.sh
``` 
script to bring up the application.

3 - Finally, use your browser or HTTP client of choice to access the application on the IP address returned from the 
```
minikube ip
```
command.



Hint 1
---

use:
```
minikube delete
```
 to stop the cluster and destroy the minikube VM.


Hint 2
---

use :
```
minikube addons enable ingress 
```
to enable ingress support in minikube. You can check whether it's enabled by running 
```
minikube addons list | grep ingress
```
