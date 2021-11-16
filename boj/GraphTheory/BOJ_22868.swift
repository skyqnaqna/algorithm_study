/*
 백준 22868 산책 (small)
 21.11.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
var preNode = [Int](repeating: 0, count: n + 1)

for _ in 0 ..< m {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  graph[e[0]][e[1]] = true
  graph[e[1]][e[0]] = true
}

let target = readLine()!.split(separator: " ").map { Int(String($0))! }
let s = target[0], e = target[1]

var answer = 0

func bfs(_ start: Int, _ end: Int) {
  preNode[start] = start
  visited[start] = true
  
  var q = [(Int, Int)](), front = 0
  q.append((start, 0))
  
  while front < q.count {
    let (now, dist) = q[front]
    front += 1
    
    if now == end {
      answer += dist
      break
    }
    
    for i in 1 ... n {
      if !graph[now][i] || visited[i] { continue }

      q.append((i, dist + 1))
      preNode[i] = now
      visited[i] = true
    }
  }
  
}

// Get S -> E
bfs(s, e)

// S -> E 오면서 방문한 노드와 경로 지우기
visited = [Bool](repeating: false, count: n + 1)

var pre = e
while pre != s {
  graph[pre][preNode[pre]] = false
  graph[preNode[pre]][pre] = false
  visited[preNode[pre]] = true
  pre = preNode[pre]
}

preNode = [Int](repeating: 0, count: n + 1)

// Get E -> S
visited[s] = false
bfs(e, s)

print(answer)
