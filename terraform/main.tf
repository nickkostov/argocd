resource "kubernetes_namespace" "this" {
  for_each = var.ns
  metadata {
    annotations = each.value.annotations

    labels = each.value.labels

    name = each.key
  }
}