// 백준 6091 핑크 플로이드
// 21.03.24

import Foundation

let n = Int(readLine()!)!
var edges = [(Int, Int, Int)]()
var graph = [[Int]](repeating: [Int](), count: n + 1)
var parent = [Int](repeating: 0, count: n + 1)

func find (_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = find(parent[a])
    return parent[a]
  } else { return a }
}

func union (_ u: Int, _ v: Int) {
  let x = find(u)
  let y = find(v)
  
  if x < y { parent[y] = x }
  else { parent[x] = y }
}

for i in stride(from: 1, to: n, by: 1) {
  let adj = readLine()!.split(separator: " ").map { Int(String($0))! }
  parent[i] = i
  
  for j in stride(from: 0, to: adj.count, by: 1) {
    edges.append((adj[j], i, i + 1 + j))
  }
}
parent[n] = n

edges.sort(by: >)
var cnt = 0

while !edges.isEmpty && cnt < n - 1 {
  let (_, u, v) = edges.removeLast()
  
  if find(u) != find(v) {
    union(u, v)
    graph[u].append(v)
    graph[v].append(u)
    cnt += 1
  }
}

for i in stride(from: 1, through: n, by: 1) {
  graph[i].sort()
  
  print(graph[i].count, terminator: " ")
  
  for j in graph[i] {
    print(j, terminator: " ")
  }
  print()
}
