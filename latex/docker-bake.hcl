
// This is what is baked by GitHub Actions
group "default" { targets = ["debian-11", "debian-10", "ubuntu-22-04", "ubuntu-20-04", "ubuntu-18-04"] }

// Targets filled by GitHub Actions: one for the regular tag, one for the debug tag
target "docker-meta-debian-11" {}
target "docker-meta-debian-10" {}
target "docker-meta-ubuntu-22-04" {}
target "docker-meta-ubuntu-20-04" {}
target "docker-meta-ubuntu-18-04" {}

// This sets the platforms and is further extended by GitHub Actions to set the
// output and the cache locations
target "base" {
  context = "latex"
  dockerfile = "base.Dockerfile"
}

target "debian-11" {
  inherits = ["base", "docker-meta-debian-11"]
  args = { VARIANT = "debian-11" }
}

target "debian-10" {
  inherits = ["base", "docker-meta-debian-10"]
  args = { VARIANT = "debian-10" }
}

target "ubuntu-22-04" {
  inherits = ["base", "docker-meta-ubuntu-22-04"]
  args = { VARIANT = "ubuntu-22.04" }
}

target "ubuntu-20-04" {
  inherits = ["base", "docker-meta-ubuntu-22-04"]
  args = { VARIANT = "ubuntu-20.04" }
}

target "ubuntu-18-04" {
  inherits = ["base", "docker-meta-ubuntu-22-04"]
  args = { VARIANT = "ubuntu-18.04" }
}