// 백준 14588 Line Friends (Small)
// 21.03.30

import Foundation

let INF = Int(1e9)
let n = Int(readLine()!)!

var lines = [(Int, Int)]()
var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

lines.append((0, 0))

for _ in 1...n {
  let p = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  lines.append((p[0], p[1]))
}

for i in 1..<n {
  for j in i + 1...n {
    if (lines[i].0 <= lines[j].1 && lines[i].1 >= lines[j].0) || (lines[j].0 <= lines[i].1 && lines[j].1 >= lines[i].0) {
      graph[i][j] = 1
      graph[j][i] = 1
    }
  }
}

for k in 1...n {
  for i in 1...n {
    if graph[i][k] == INF { continue }
    for j in 1...n {
      if graph[k][j] == INF { continue }
      if graph[i][k] + graph[k][j] < graph[i][j] {
        graph[i][j] = graph[i][k] + graph[k][j]
        graph[j][i] = graph[i][j]
      }
    }
  }
}

let q = Int(readLine()!)!

for _ in 1...q {
  let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  if graph[ab[0]][ab[1]] == INF { print(-1) }
  else { print(graph[ab[0]][ab[1]]) }
}
