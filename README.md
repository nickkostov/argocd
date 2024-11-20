# argocd
Repository containing hypotetical bootstrap of ArgoCD

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

- Manifest = install.yaml
- Recommended for dev
- Single pods and replicas for Argo CD components

### High Availability