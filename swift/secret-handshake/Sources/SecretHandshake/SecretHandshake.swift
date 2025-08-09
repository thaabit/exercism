func commands(number: Int) -> [String] {
  var out : [String] = []
  let bin = Array(String(number, radix: 2).reversed())
  let cmds = ["wink", "double blink", "close your eyes", "jump"]
  for (i, val) in bin.enumerated() {
    if i == 4 {
        out = out.reversed()
    } else if i < 4 && Int(String(val)) == 1 {
        out.append(cmds[i])
    }
  }
  return out
}
