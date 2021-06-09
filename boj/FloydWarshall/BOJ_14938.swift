/*
 백준 14938 서강그라운드
 21.06.09
 https://github.com/skyqnaqna/algorithm_study
 */

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], r = input[2]
let nodes = readLine()!.split(separator: " ").map { Int(String($0))! }
let INF = Int(1e9)

var graph = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

for _ in 0..<r {
  let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
  let u = edge[0] - 1, v = edge[1] - 1, w = edge[2]
  graph[u][v] = w
  graph[v][u] = w
}

for i in 0..<n {
  graph[i][i] = 0
}

for k in 0..<n {
  for i in 0..<n {
    for j in 0..<n {
      if graph[i][k] + graph[k][j] < graph[i][j] {
        graph[i][j] = graph[i][k] + graph[k][j]
      }
    }
  }
}

var answer = 0
for i in 0..<n {
  var sum = 0
  for j in 0..<n {
    if graph[i][j] <= m {
      sum += nodes[j]
    }
  }
  if answer < sum {
    answer = sum
  }
}

print(answer)
