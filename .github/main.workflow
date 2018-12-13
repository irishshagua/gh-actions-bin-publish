workflow "Complimenter Build Pipeline" {
  on = "push"
  resolves = ["Cargo Test"]
}

action "Cargo Test" {
  uses = "./actions/test_action"
  runs = "echo \"Hello World!\""
}
