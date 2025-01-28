data "template_file" "user_data" {
  template = file("${path.module}/script.sh")

  vars = {
    PACKAGE_MANAGER = var.linux_distro == "ubuntu" ? "apt" : "yum"
  }
}
