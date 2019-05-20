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

Use MySQL with Your Ruby on Rails Application on CentOS 7
---

* Install MySQL and its development libraries:
```
sudo yum install mariadb-server mariadb-devel
```
* When the installation is complete, we need to start MySQL with the following command:
```
sudo systemctl start mariadb
```
* Now that our MySQL database is running, we want to run a simple security script that will remove some dangerous defaults and lock down access to our database system a little bit. Start the interactive script by running:
```
sudo mysql_secure_installation
```
* The last thing you will want to do is enable MariaDB to start on boot. Use the following command to do so:
```
sudo systemctl enable mariadb.service
```

Install MySQL Gem
---

* As the Rails user, install the mysql2 gem, like this:
```
gem install mysql2
```

Create New Rails Application
---

```
rails new appname -d mysql
```

* Configure Database Connection

open your application's database configuration file in your favorite text editor. We'll use vi:
```
vi config/database.yml
```
Under the default section, find the line that says "password:" and add the password to the end of it. It should look something like this (replace the highlighted part with your MySQL root password): 
```
password: mysql_root_password
```
Save and exit.

Create Application Databases
---

Create your application's development and test databases by using this rake command
```
rake db:create
```
Test Configuration
---

The easiest way to test that your application is able to use the MySQL database is to try to run it.

For example, to run the development environment (the default), use this command:
```
rails server
```
This will start your Rails application on your localhost on port 3000.


Create New Rails app with postgres database:
---

* type this command to do that :
```
rails new app-name --database=postgresql
```

Notes
---

* The resources used in this cluster are as the following:

1-Service is an abstraction which defines a logical set of Pods running somewhere in your cluster, that all provide the same functionality. When created, each Service is assigned a unique IP address (also called clusterIP).

2-Deployments represent a set of multiple, identical Pods with no unique identities.

3-ConfigMap resource provides mechanisms to inject containers with configuration data.

4-A persistent volume claim (PVC) is a request for the platform to create a PV for you, and you attach PVs to your pods via a PVC.

5-Ingress is an object that allows access to your Kubernetes services from outside the Kubernetes cluster.

* Note: It is better to use secret or vault instead of configMap for sensitive info like DB password.I put DB migrations at the end of Dockerfile.

Usage
---

* To deploy the cluster run this command: 
```
kubectl apply -f k8s
```

Test
---

* You have 2 ways.The first one is to forward port from the localhost to the cluster by using this command:
```
kubectl port-forward $( kubectl get pods -l component=drkiq -o=jsonpath='{.items[0].metadata.name}') 8000:8000
```
Then go to http://localhost:8000

The second way by using Ingress Controller, but you have first enable Ingress add-on in minikube by using this command:
```
minikube addons enable ingress
```
You have to wait sometime untill the controller is installed.You can check if it is installed or not by using this command:
```
kubectl get pods -n kube-system | grep nginx-ingress-controller
```
If you found the status is runnig, then go to the next step which is you get minikube ip to access the app by using this command:
```
minikube ip
```
After you get the IP , put it in the browser and you will get your app.


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
