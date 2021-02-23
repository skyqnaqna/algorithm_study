// 백준 16500 문자열 판별
// 21.02.23

import Foundation

let s = readLine()!.map { String($0) }
let n = Int(readLine()!)!
var d = Array(repeating: 0, count: s.count + 1)
var words: [String] = []

for _ in stride(from: 0, to: n, by: 1) { words.append(readLine()!) }
let len = s.count

d[len] = 1

for pos in stride(from: len - 1, through: 0, by: -1) {
  for word in words {
    if pos + word.count <= len && word == s[pos..<pos + word.count].joined() && d[pos + word.count] == 1 {
      d[pos] = 1
    }
  }
}

print(d[0])
