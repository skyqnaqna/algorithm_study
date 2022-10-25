/*
 백준 1389 케빈 베이컨의 6단계 법칙
 22.10.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]
let INF = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

for _ in 0 ..< m {
  let edge = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

  graph[edge[0]][edge[1]] = 1
  graph[edge[1]][edge[0]] = 1
}

for i in 0 ..< n { graph[i][i] = 0 }

for k in 0 ..< n {
  for i in 0 ..< n {
    for j in 0 ..< n {
      if i == j { continue }

      if graph[i][k] + graph[k][j] < graph[i][j] {
        graph[i][j] = graph[i][k] + graph[k][j]
      }
    }
  }
}

var minVal = INF, answer = -1

for i in 0 ..< n {
  let sum = graph[i].filter { $0 < INF }.reduce(0, +)

  if sum < minVal {
    minVal = sum
    answer = i
  }
}

print(answer + 1)
