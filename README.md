[![CircleCI](https://circleci.com/gh/long161711/capstoneProject.svg?style=svg)](https://circleci.com/gh/long161711/capstoneProject)
# udacity_devops_capstone

#######
Categories:
1. Set Up Pipeline
2. Build Docker Container
3. Deployment

This app use:
1. Use Jenkins or Circle CI, and implement blue/green or rolling deployment.
2. Pick AWS Kubernetes as a Service, or build your own Kubernetes cluster.
3. Build my pipeline on circleci
4. Test my pipeline.

How the cluster is deployed:
1. Create cluster with eksctl in command line and connect it to AWS account with command line "eksctl create cluster --config-file=./infra/cluster.yml"
2. It will make cluster in AWS and three Stacks in Cloud formation
3. 2.1.1 eksctl-k8s-demo-cluster
4. 2.1.2 eksctl-k8s-demo-addon-iamserviceaccount-kube-system-aws-node
5. 2.1.3 eksctl-k8s-demo-nodegroup-capstone-app
6. Create web application and circle ci file (config.yml)
7. In config.yml I create  deployment and deploy into cluster in AWS
8. 4.1.1 kubectl apply --filename by apply file with name k8s/deployment.yaml that i have configure: This command uses envsubst to perform environment variable  substitution on the k8s/deployment.yaml file and then applies the updated configuration to the Kubernetes cluster using kubectl apply.
9. 4.1.2 k8s/service-green.yaml | kubectl apply --filename -: Similar to the first command, this line uses envsubst to replace environment variables in the k8s/service-green.yaml file and applies the updated configuration using kubectl apply.
10. 4.1.3 LOAD_BALANCER=$(kubectl get services flask-app-green --output jsonpath='{.status.loadBalancer.ingress[0].hostname}'): This line retrieves the hostname of the load balancer associated with the service named "flask-app-green" using kubectl get services. The result is stored in the variable LOAD_BALANCER.
11. 4.1.4 kubectl delete services flask-app-green: If the service "flask-app-green" exists (as determined by the previous command), this line deletes the service using kubectl delete services.
12. 4.1.5 kubectl delete deployments $deploy: If the condition in the previous line is true, this command deletes the deployment with the name stored in the deploy variable using kubectl delete deployments.
