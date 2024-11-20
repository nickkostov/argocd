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