// 백준 11403 경로 찾기
// 21.03.21

import Foundation

let n = Int(readLine()!)!

var graph: [[Int]] = []

for _ in 0..<n {
  let line = readLine()!.split(separator: " ").map { Int(String($0))! }
  graph.append(line)
}

for k in 0..<n {
  for i in 0..<n {
    for j in 0..<n {
      if graph[i][k] == 1 && graph[k][j] == 1 { graph[i][j] = 1 }
    }
  }
}

for i in 0..<n {
  for j in 0..<n {
    print(graph[i][j], terminator: " ")
  }
  print()
}
