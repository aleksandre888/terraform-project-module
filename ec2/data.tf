data "template_file" "user_data" {
  template = file("script.sh")

  vars = {
    PACKAGE_MANAGER = var.linux_distro == "ubuntu" ? "apt" : "yum"
  }
}