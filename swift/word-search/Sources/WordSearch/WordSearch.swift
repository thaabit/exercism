import Foundation

// allows for string[index]
extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}
func search(words: [String], in gridRows: [String]) -> [String:WordLocation?] {
    let width = gridRows[0].count, height = gridRows.count
    let directions = [(0,1),(1,1),(1,0),(0,-1),(-1,-1),(-1,0),(-1,1),(1,-1)] // left, right, up, down, 4 diagonals
    var out:[String:WordLocation?] = [:]
    for word in words {
        out[word] = nil
        OUTER: for (y, row) in gridRows.enumerated() {
            for (x, c) in Array(row).map({String($0)}).enumerated() {

                // found the first letter of the word
                if c == word[0] {

                    // branch out in all directions and check
                    for d in directions {
                        var nextX = x + d.0, nextY = y + d.1, wordIndex = 1
                        while true {

                            // are we still in the grid
                            guard nextX >= 0 && nextX < width && nextY >= 0 && nextY < height else { break }

                            // is the next letter still valid
                            guard gridRows[nextY][nextX] == word[wordIndex] else { break }

                            // we at the end of the word, mark it
                            if wordIndex == word.count - 1 {
                                out[word] = WordLocation(
                                    start: WordLocation.Location(row:y+1, column:x+1),
                                    end  : WordLocation.Location(row:nextY+1, column:nextX+1),
                                )
                                break OUTER
                            }

                            // prep for next character check
                            nextX += d.0; nextY += d.1; wordIndex += 1
                        }
                    }
                }
            }
        }
    }
    return out
}
