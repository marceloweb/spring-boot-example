## DevOps with Jenkins and Kubernetes

```
$ kubectl create secret generic credentials --from-env-file kubernetes/credentials.txt
$ kubectl create -f kubernetes/deployment.yml
$ kubectl create -f kubernetes/services.yml
$ kubectl scale deployment springboot-deployment --replicas=3
```
