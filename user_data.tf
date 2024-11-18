data "cloudinit_config" "linux" {
  part {
    filename     = "setup.sh"
    content_type = "text/x-shellscript"

    content = templatefile("${path.module}/provision/setup.sh.tftpl", {
      hostname = var.hostname
    })
  }
}
