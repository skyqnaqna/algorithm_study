/*
 백준 1719 택배
 21.06.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], m = input[1]
let INF = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
var answer = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<m {
  let l = readLine()!.split(separator: " ").map{ Int(String($0))! }

  graph[l[0]][l[1]] = l[2]
  graph[l[1]][l[0]] = l[2]

  answer[l[0]][l[1]] = l[1]
  answer[l[1]][l[0]] = l[0]
}

for k in 1...n {
  for i in 1...n {
    for j in 1...n {
      if i == j || i == k || j == k { continue }
      if graph[i][k] + graph[k][j] < graph[i][j] {
        graph[i][j] = graph[i][k] + graph[k][j]
        answer[i][j] = answer[i][k]
      }
    }
  }
}

for i in 1...n {
  for j in 1...n {
    if answer[i][j] == INF {
      print("-", terminator: " ")
    } else {
      print(answer[i][j], terminator: " ")
    }
  }
  print()
}
