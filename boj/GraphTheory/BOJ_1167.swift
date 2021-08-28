/*
 백준 1167 트리의 지름
 21.08.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let v = Int(readLine()!)!
var tree = [[(Int, Int)]](repeating: [(Int, Int)](), count: v + 1)

for _ in 0 ..< v {
  let info = readLine()!.split(separator: " ").map { Int(String($0))! }
  let u = info[0]

  for i in stride(from: 1, to: info.count - 2, by: 2) {
    tree[u].append((info[i], info[i + 1]))
  }
}

var farNode = 0, dist = 0
var visited = [Bool](repeating: false, count: v + 1)

func dfs(_ node: Int, _ cost: Int) {
  if cost > dist {
    dist = cost
    farNode = node
  }

  for next in tree[node] {
    if !visited[next.0] {
      visited[next.0] = true
      dfs(next.0, cost + next.1)
      visited[next.0] = false
    }
  }
}

visited[1] = true
dfs(1, 0)

dist = 0
visited = [Bool](repeating: false, count: v + 1)

visited[farNode] = true
dfs(farNode, 0)

print(dist)