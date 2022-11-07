build {
  name = "rolling_update_{{timestamp}}"

  sources = [
    "source.amazon-ebs.main"
  ]

  provisioner "shell" {
    script = "scripts/basic-website.sh"
    environment_vars = [
      "COLOR=${var.color}",
    ]
    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
  }
}