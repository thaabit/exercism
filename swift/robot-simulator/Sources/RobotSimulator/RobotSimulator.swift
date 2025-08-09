enum Bearing : String {
    case north, east, south, west
    var raw: String { self.rawValue }
}
class SimulatedRobot {
  let dirs = ["north", "east", "south", "west"]
  struct State {
    var x: Int
    var y: Int
    var bearing: Bearing
  }
  var state : State
  init(x:Int,y:Int,bearing:Bearing) {
    self.state = State(x: x, y: y, bearing: bearing)
  }
  func move(commands: String) {
    for cmd in Array(commands) {
        let b = state.bearing.raw
        switch String(cmd) {
            case "R": state.bearing = b == "west" ? .north : Bearing(rawValue: dirs[dirs.index(dirs.firstIndex(of:b)!, offsetBy: 1)])!
            case "L": state.bearing = b == "north" ? .west : Bearing(rawValue: dirs[dirs.index(dirs.firstIndex(of:b)!, offsetBy: -1)])!
            case "A":
                switch b {
                    case "north": state.y += 1
                    case "south": state.y -= 1
                    case "east" : state.x += 1
                    case "west" : state.x -= 1
                    default:continue
                }
            default:continue
        }
    }
  }
}
