// 백준 18352 특정 거리의 도시 찾기
// 21.03.25

import Foundation

let INF = Int(1e9)
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
let k = input[2]
let x = input[3]

var dist = [Int](repeating: INF, count: n + 1)
var edges = [[Int]](repeating: [Int](), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
var ans = [Int]()

for _ in 0..<m {
  let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  edges[edge[0]].append(edge[1])
}

var q = [(Int, Int)]()
dist[x] = 0
q.append((x, 0))

while !q.isEmpty {
  let (now, cost) = q.removeFirst()
  visited[now] = true
  if dist[now] < cost || cost >= k { continue }

  for next in edges[now] {
    if cost + 1 < dist[next] {
      dist[next] = cost + 1
      
      if !visited[next] {
        q.append((next, cost + 1))
        if cost + 1 == k { ans.append(next) }
      }
    }
  }
}

ans.sort()

if !ans.isEmpty { for i in ans { print(i) }}
else { print(-1) }
