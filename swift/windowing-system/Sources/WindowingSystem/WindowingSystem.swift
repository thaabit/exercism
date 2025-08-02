struct Size {
    var width = 80
    var height = 60
    mutating func resize(newWidth: Int, newHeight: Int) {
        self.width = newWidth
        self.height = newHeight

    }
}

struct Position {
    var x = 0
    var y = 0
    mutating func moveTo(newX: Int, newY: Int) {
        self.x = newX
        self.y = newY
    }
}

class Window {
    var title = "New Window"
    var screenSize = Size(width: 800, height: 600)
    var size = Size()
    var position = Position()
    var contents : String? = nil


    init() { }
    init(title:String, contents:String?, size:Size = Size(), position:Position = Position()) {
        self.title = title
        if let c = contents {
            self.contents = c
        }
        self.size = size
        self.position = position
    }

    func resize(to size : Size) -> () {
        var w = size.width
        var h = size.height
        if h < 1 { h = 1 }
        if w < 1 { w = 1 }
        if self.position.y + h > self.screenSize.height { h = self.screenSize.height - self.position.y }
        if self.position.x + w > self.screenSize.width  { w = self.screenSize.width  - self.position.x }
        self.size = Size(width:w, height:h)
    }

    func move(to position : Position) {
        var x = position.x
        var y = position.y
        if x < 0 { x = 0 }
        if y < 0 { y = 0 }
        if x + self.size.width  > self.screenSize.width  { x = self.screenSize.width - self.size.width  }
        if y + self.size.height > self.screenSize.height { y = self.screenSize.height - self.size.height }

        self.position = Position(x:x, y:y)
    }

    func update(title: String) {
        self.title = title
    }

    func update(text: String?) {
        if let t = text {
            self.contents = t
        } else {
            self.contents = nil
        }
    }

    func display() -> String {
        let c = self.contents ?? "[This window intentionally left blank]"
        return "\(self.title)\nPosition: (\(self.position.x), \(self.position.y)), Size: (\(self.size.width) x \(self.size.height))\n\(c)\n"
    }
}
