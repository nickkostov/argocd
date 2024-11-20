# argocd
Repository containing hypotetical bootstrap of ArgoCD

<a href="https://argo-cd.readthedocs.io/en/stable/"><img src="https://argo-cd.readthedocs.io/en/stable/assets/logo.png" /></a>

---

# Requirements:
- `kubectl` command line tool installed.
- k8s cluster
- Cluster Admin Level Access
- kubeconfig configured to connect to your cluster
- Access to GitHub

**NB** I am using Docker K8s Cluster for localtesting of the lab.

---


# Deploying Argo CD:

## Types of installs:

### Non High Availability

![Non High Availability](images/non-ha.png)

- Manifest = install.yaml
- Recommended for dev
- Single pods and replicas for Argo CD components

### High Availability

![High Availability](images/ha.png)
- Manifest = namespace-install.yaml
- Recommended for prod
- Turned for high availabiltiy and resiliency
- Multiple replicas for supported components

### Core Install
- Manifest = core-install.yaml
- Use when multi-tenancy features (web ui, API server, etc...) are not needed
- Installs the lightweight (non-HA) Version of each component

### Cluster Level Installation

![Cluster Level](images/cluster-level.png)

- Use when you have cluster level access nad will deploy apps in the same cluster Argo CD runs on.

### Namespace Level Installation

![Namespace Level](images/ns-level.png)

- Use when you have namespace level access and will deploy apps to **external** K8s Clusters from where Argo CD is running.
- You need to authenticate the external clusters with Argo CD.

## Install Argo CD:

1. Create a namespace for Argo CD to deploy all of its components in:

```bash
kubectl get namespace argocd
``` 
Or you could adjust the ```provider.tf``` file to work with your cluster or set it up with a remote ```backend.tf``` 

2. Install Argo CD into the new namespace you created. Reference Argo CD's GitHub repository for the latest Argo CD operator.


*Hint* this is from the stable release branch!
```bash
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

# Accesss Argo CD API Server

There only two ways:

1. Web UI
2. Argo CD CLI


MacOS/Linux
```bash
brew install argocd
```

Windows
```pwsh
Chocolatey install argocd-cli
```


## Argo CD CLI

- Argo CD has a Command Line Interface to Access the API Server
- Some Activities can only be performed via the Argo CD CLI such as **adding new cluster** and managing user accounts
- Script/Automate Using Argo CD CLI

### Common commands:
#### Account
- Login:
```bash
argocd login
```
- Logout:
```bash
argocd logout
```
- Manage account settings
```bash
argocd account
```
- Change current user's password:
```bash
argocd account update-password
```
- Get user information:
```bash
argocd account get-user-info
```
#### Projects
- Manage projects
```bash
argocd proj
```
- List all available projects
```bash
argocd proj list
```
- Create a new project with name PROJECT
```bash
argocd proj create PROJECT
```
- Delete the project with name PROJECT
```bash
argocd proj delete PROJECT
```
- Edit the information on project with name PROJECT
```bash
argocd proj edit PROJECT
```
#### Applications
- Manage applications
```bash
argocd app
```
- List all the applications.
```bash
argocd app list
```
- Get the details of a application
```bash
argocd app get my-app
```
- Set an override parameter
```bash
argocd app set my-app -p image.tag=v1.0.1
```
#### Repositories
- Manage repository connection parameters
```bash
argocd repo add git@git.example.com:repos/repo
```
- Get a Configured Repository by URL
```bash
argocd repo get https://github.com/yourusername/your-repo.git
```
- List Configured Repositories
```bash
argocd repo list
```
- Remove Repository Credentials
```bash
argocd repo rm https://github.com/yourusername/your-repo.git
```
#### Version 
```bash
argocd version 
```
#### Complex Operations

Check argocd-util

#### Cluster Operations:

- Manage cluster credentials
```bash
  argocd cluster [flags]
  argocd cluster [command]
```
- List all known clusters in JSON format:
```bash 
argocd cluster list -o json
```
- Add a target cluster configuration to ArgoCD. The context must exist in your kubectl config:
```bash 
argocd cluster add example-cluster
```
- Get specific details about a cluster in plain text (wide) format:
```bash 
argocd cluster get example-cluster -o wide
```
- Remove a target cluster context from ArgoCD
```bash 
argocd cluster rm example-cluster
```
- Set a target cluster context from ArgoCD
```bash 
argocd cluster set CLUSTER_NAME --name new-cluster-name --namespace '*'
argocd cluster set CLUSTER_NAME --name new-cluster-name --namespace namespace-one --namespace namespace-two
```