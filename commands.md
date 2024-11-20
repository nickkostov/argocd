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
