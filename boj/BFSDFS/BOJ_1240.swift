/*
 21.10.06
 백준 1240 노드사이의 거리
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var edges = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)

for _ in 0 ..< n - 1 {
  let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
  edges[edge[0]].append((edge[1], edge[2]))
  edges[edge[1]].append((edge[0], edge[2]))
}

func getDist(_ from: Int, _ to: Int) -> Int {
  var res = 0
  var visited = [Bool](repeating: false, count: n + 1)
  var q = [(Int, Int)](), front = 0
  visited[from] = true
  q.append((from, 0))
  
  while front < q.count {
    let (now, dist) = q[front]
    front += 1
    
    if now == to {
      res = dist
      break
    }
    
    for (next, cost) in edges[now] {
      if !visited[next] {
        visited[next] = true
        q.append((next, dist + cost))
      }
    }
  }
  
  return res
}


var ans = ""
for _ in 0 ..< m {
  let q = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  ans += "\(getDist(q[0], q[1]))\n"
}

print(ans)
