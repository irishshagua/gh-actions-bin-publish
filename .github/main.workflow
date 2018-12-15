workflow "Complimenter Build Pipeline" {
  on = "push"
  resolves = ["Cargo Windows Builder", "Cargo Linux Builder"]
}

action "Cargo Test" {
  uses = "./.github/actions/cargo"
  runs = "cargo test"
}

action "Cargo Windows Builder" {
  uses = "./.github/actions/buildEnvironments/windows"
  needs = ["Cargo Test"]
  runs = "cargo build --release --target=x86_64-pc-windows-gnu"
}

action "Cargo Linux Builder" {
  uses = "./.github/actions/buildEnvironments/linux"
  needs = ["Cargo Test"]
  runs = "cargo build --release --target=x86_64-unknown-linux-gnu"
}
