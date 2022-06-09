 resource "null_resource" "this" {
  provisioner "local-exec" {
    command = "${var.text}"
  }
}