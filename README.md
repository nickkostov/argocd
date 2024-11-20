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
## URL Logic:

Non HA (High Availabiltiy)
```bash
VERSION=v2.13.1
https://raw.githubusercontent.com/argoproj/argo-cd/$VERSION/manifests/install.yaml
```

HA
```bash
VERSION=v2.13.1
https://raw.githubusercontent.com/argoproj/argo-cd/$VERSION/manifests/ha/install.yaml
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

[Check Here](commands.md)

## Argo CD Web UI

### Use Service Type Load Balancer

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

If you are using a local k8s emulator: https://localhost

### Port Forwarding

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

### Password First Time 

- Get inital password
```bash
argocd admin initial-password -n argocd
```
- Change password

```bash
argocd account update-password
```

## Upgrading Argo CD

- Follows Sematic Versioning

| Major       | Minor       | Patch      |
| -------------------------------------------------- | ----------- | -----------|
| Major versions makes **incompatible** API Changes      | Minor version adds **functionality** in a compatible manner | Patch Makes **backward compatible** bug fixes|
| Major Introduces backward incompatible behaviour changes with previous Argo CD versions| Minor might introduce changes to Argo CD with a workaround | Patch such as Argo CD v1.6.1 to 1.6.3 does not introduce any breaking changes|


### Quick scripts for upgrade:

> You just need to increment the numbers 🧐

Non HA (High Availabiltiy)

```bash
#!/bin/bash

VERSION=v2.13.1
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/${VERSION}/manifests/install.yaml
```

HA
```bash
#!/bin/bash

VERSION=v2.13.1
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/${VERSION}/manifests/ha/install.yaml
```
