# hello-deployment

This hello-deployment project works charm in mac operation system [Tested]

What is in it for you?

You will get to know about multiple systems such as Continous Integration Server, Deployment Server, Artifacts system etc that are part of build and deployment automation.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/BDA.png?raw=true)


### Environment Setup

Fork this repository and then clone using "git clone https://www.githut.com/[YOUR_GIT_ID]/hello-deployment.git".
Go into "hello-deployment/DevVM/mac" and execute "./bootscript.sh"

Done and dusted!!

### Bintray Account

The docker images that are built during the automated build in Jenkins are stored in bintray as an artifacts.

1) Sign up for a bintray account at https://bintray.com/signup/oss. 

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/01.%20Register.png?raw=true)

2) Create an Organization

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/02.%20Create%20New%20Organization.png?raw=true)

3) Enter organization details and proceed.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/03.%20Create%20New%20Organization.png?raw=true)

4) Create sandbox repository

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/04.%20Create%20New%20Repository.png?raw=true)

5) Enter sandbox repository details and proceed.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/05.%20Create%20New%20Repository.png?raw=true)

6) Also create staging and release repositories.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/06.%20Add%20Related%20Repositories.png?raw=true)

7) Now you have all the repositories needed.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/07.%20Bintray%20Home.png?raw=true)

8) Select any repository and click on "Set ME UP".

#### Setting up your credentials

Setting up your credentials is only required when resolving from a private Docker repository. 
Use the Docker client login command to authenticate (please use Docker v1.6 and above):

`docker login -u vijayendra -p <API_KEY> -e <EMAIL> mudigal-docker-hello-sanbox.bintray.io`

#### Pulling Docker Images

Use the Docker client pull command to download an image (please use Docker v1.6 and above):

`docker pull mudigal-docker-hello-sanbox.bintray.io/<NAMESPACE>/<PACKAGE_NAME>:<VERSION>`

\<NAMESPACE\> - Optional. When not specified "library:" will be used as the prefix to the Bintray package name.
\<VERSION\> - Optional. When not specified "latest" will be used as the Bintray version name.


#### Pushing Docker Images

Tag your image according to the following convention by running the following command:

`docker tag <IMAGE_ID> mudigal-docker-hello-sanbox.bintray.io/<NAMESPACE>/<PACKAGE_NAME>:<VERSION>`

Use the Docker client push command to upload and publish your images (please use Docker v1.6 and above):

`docker push mudigal-docker-hello-sanbox.bintray.io/<NAMESPACE>/<PACKAGE_NAME>:<VERSION>`

\<NAMESPACE\> - Optional. When not specified "library:" will be used as the prefix to the Bintray package name.
\<VERSION\> - Optional. When not specified "latest" will be used as the Bintray version name.


![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/08.%20Bintray%20Setup.png?raw=true)

9) Note down API Key that you need to use to push artifacts.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/09.%20API%20Key%20(Password%20Confirmation).png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Artifactory/10.%20API%20Key.png?raw=true)

### Jenkins Setup

Jenkins is used as continous build, delivery and deployment server.

In you host system goto "http://localhost:8082" to access Jenkins and do the initial setup.

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/00.%20Initial%20Password.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/01.%20Password.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/02.%20Install%20Plugins.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/03.%20Plugins%20selection.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/04.%20Plugins%20Installation.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/05.%20Create%20User.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/06.%20Jenkins%20Ready.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/07.%20Jenkins%20Dashboard.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/08.%20Setup%20Credentials.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/09.%20Jenkins%20Job.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/10.%20Job%20Configure.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/11.%20Build%20Job.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/12.%20Build%20Status.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Jenkins/13.%20Jenkins%20Dashboard.png?raw=true)


### Kubernetes Dashboard

To access kubernetes dashboard, goto command prompt and execute "kubectl proxy".
You can now access the dashboard at http://127.0.0.1:8001/ui 

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Kubernetes/01.%20Kube-system%20Workloads.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Kubernetes/02.%20Development%20Workloads.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Kubernetes/03.%20Development%20Services.png?raw=true)

Access the deployed application at http://127.0.0.1:8001/api/v1/namespaces/development/services/hello:8040/proxy/

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Kubernetes/04.%20Hello%20ROOT.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Kubernetes/05.%20Hello%20:vi.png?raw=true)


### Grafana Dashboard

Access grafana dashboard at http://127.0.0.1:8001/api/v1/proxy/namespaces/kube-system/services/monitoring-grafana/

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Grafana/01.%20Cluster%20Info.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Grafana/02.%20Pod%20Info.png?raw=true)

![Alt text](https://github.com/vmudigal/hello-deployment/blob/develop/screenshot/Grafana/03.%20Pod%20Info.png?raw=true)
