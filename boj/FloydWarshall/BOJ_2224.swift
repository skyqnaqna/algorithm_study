// 백준 2224 명제 증명
// 21.03.26

import Foundation

let n = Int(readLine()!)!
var graph = [[Bool]](repeating: [Bool](repeating: false, count: 58), count: 58)

for _ in 0..<n {
  let i = readLine()!.split(separator: " ").map { String($0) }
  let p = Int(UnicodeScalar((i.first)!)!.value) - 65
  let q = Int(UnicodeScalar((i.last)!)!.value) - 65
  
  graph[p][q] = true
}

for k in 0..<58 {
  for i in 0..<58 {
    for j in 0..<58 {
      if graph[i][k] && graph[k][j] {
        graph[i][j] = true
      }
    }
  }
}

var ans = 0
for i in 0..<58 {
  for j in 0..<58 {
    if i == j { continue }
    if graph[i][j] { ans += 1 }
  }
}
print(ans)

for i in 0..<58 {
  for j in 0..<58 {
    if i == j { continue }
    if graph[i][j] {
      print(String(UnicodeScalar(i + 65)!) + " => " + String(UnicodeScalar(j + 65)!))
    }
  }
}
