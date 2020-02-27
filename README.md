## DevOps with Jenkins and Kubernetes

### 1. Environments variables

| Variable | Type |
|--|--|
| DB_HOST | String |
| DB_NAME | String |
| DB_USER | String |
| DB_PASSWD | String |
| GOOGLE_APPLICATION_CREDENTIALS | File |
| GCP_PROJECT | String |
| GCP_REGION | String |  
| GCP_ACCOUNT | String
| CREDENTIALS | String |

### 2. Jobs

| Job | Branch | Pipeline |
|--|--|--|
| build-spring-boot-example | master | misc/Jenkinsfile |
| build-spring-boot-example-canary | canary | misc/Jenkinsfile.canary |
| create-cluster | master | misc/Jenkinsfile.cluster |
| deploy-spring-boot-example-prod | master | misc/Jenkinsfile.prod |

### 3. Pipelines

#### 3.1 Jenkinsfile

Pull the source code from the repository, do tests, create a new docker image and send it to the Registry.
The build is based on the master branch.

#### 3.2 Jenkinsfile.canary

It does the same job as item 3.1 but this build is based on the canary branch.

#### 3.3 Jenkinsfile.cluster

Creates a Kubernetes cluster on Google Cloud.

#### 3.4 Jenkinsfile.prod

Go up the application in the new cluster. Creates load balancer and auto-scaling.
