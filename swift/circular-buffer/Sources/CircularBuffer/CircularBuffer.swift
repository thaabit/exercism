enum CircularBufferError : Error {
    case bufferEmpty, bufferFull
}

struct CircularBuffer {
    var capacity:Int
    var buffer:[Int] = []
    init(capacity:Int) {
        self.capacity = capacity
    }

    mutating func read() throws -> Int {
        guard buffer.count != 0 else {
            throw CircularBufferError.bufferEmpty
        }
        return buffer.remove(at:0)
    }

    mutating func write(_ val: Int) throws {
        guard buffer.count < self.capacity else {
            throw CircularBufferError.bufferFull
        }
        buffer.append(val)
    }

    mutating func overwrite(_ val: Int) {
        if buffer.count == self.capacity {
            buffer.remove(at:0)
        }
        buffer.append(val)
    }

    mutating func clear() {
        buffer = []
    }
}
