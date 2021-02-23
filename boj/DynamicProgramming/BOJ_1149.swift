// 백준 1149 RGB거리
// 21.02.24

import Foundation

let n = Int(readLine()!)!

var rgb = readLine()!.split(separator: " ").map { Int(String($0))! }

for _ in stride(from: 1, to: n, by: 1) {
  var next = readLine()!.split(separator: " ").map { Int(String($0))! }
  next[0] += min(rgb[1], rgb[2])
  next[1] += min(rgb[0], rgb[2])
  next[2] += min(rgb[0], rgb[1])
  
  rgb[0] = next[0]; rgb[1] = next[1]; rgb[2] = next[2]
}

print(min(rgb[0], min(rgb[1], rgb[2])))
