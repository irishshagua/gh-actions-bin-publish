workflow "Complimenter Build Pipeline" {
  on = "push"
  resolves = ["Cargo Test"]
}

action "Cargo Test" {
  uses = "./.github/actions/cargo"
  runs = "cargo --version"
}
