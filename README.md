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

### 4. Database

Run the SQL db_dump.sql script that contains the test base. Use a MariaDB server.

### 5. To test the application deploy

#### GET

```
$ curl -i http://x.x.x.x:8080/api/v1/users

```

##### Result

```
[
 {
   id: 5,
   firstName: "Leticia",
   lastName: "Parker",
   email: "lele@email.com",
   createdAt: "2020-02-24 22:03:34",
   createdBy: 1,
   updatedAt: null,
   updatedBy: null
 },
 {
   id: 6,
   firstName: "Alissa",
   lastName: "Parker",
   email: "ali@email.com",
   createdAt: "2020-02-24 22:04:24",
   createdBy: 1,
   updatedAt: null,
   updatedBy: null
 },
 {
   id: 7,
   firstName: "Laura",
   lastName: "Parker",
   email: "laurinha@email.com",
   createdAt: "2020-02-24 22:04:53",
   createdBy: 1,
   updatedAt: null,
   updatedBy: null
 }
]

```

#### POST

```
curl -i http://172.18.0.3:8080/api/v1/users -d "{\"first_name\":\"Walter\",\"last_name\":\"Disney\",\"email\":\"ddd@email.com\"}" -H "Content-Type: application/json"

```
#### GET Canary

```
$ curl -i http://x.x.x.x:8080/api/v1/users-canary/

```

##### Result

```
{"result":"Canary Deployment"}

```

### 6. Docker Hub

```
https://hub.docker.com/r/marceloweb/spring-boot-demo/tags

```

### 7. Docker Compose with Jenkins for tests

```
$ cd ci
$ docker-compose up -d

```
