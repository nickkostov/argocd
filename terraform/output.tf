# Output for namespace names
output "namespace_names" {
  value = [for ns in kubernetes_namespace.this : ns.metadata[0].name]
  description = "List of created Kubernetes namespace names"
}

# Output for namespace annotations
output "namespace_annotations" {
  value = {
    for k, ns in kubernetes_namespace.this : k => ns.metadata[0].annotations
  }
  description = "Map of namespace annotations for each namespace"
}

# Output for namespace labels
output "namespace_labels" {
  value = {
    for k, ns in kubernetes_namespace.this : k => ns.metadata[0].labels
  }
  description = "Map of namespace labels for each namespace"
}
