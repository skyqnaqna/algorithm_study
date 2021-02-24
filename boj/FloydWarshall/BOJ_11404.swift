// 백준 11404 플로이드
// 21.02.24

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let INF = Int(1e9)

var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for _ in stride(from: 0, to: m, by: 1) {
  let bus = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  graph[bus[0]][bus[1]] = min(graph[bus[0]][bus[1]], bus[2])
}

for k in stride(from: 1, through: n, by: 1) {
  for a in stride(from: 1, through: n, by: 1) {
    for b in stride(from: 1, through: n, by: 1) {
      if a == b || a == k || b == k { continue }
      graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
    }
  }
}

for i in stride(from: 1, through: n, by: 1) {
  for j in stride(from: 1, through: n, by: 1) {
    if graph[i][j] >= INF { print(0, terminator: " ") }
    else { print(graph[i][j], terminator: " ") }
  }
  print()
}
