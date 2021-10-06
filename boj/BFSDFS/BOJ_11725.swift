/*
 21.10.06
 백준 11725 트리의 부모 찾기
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var edges = [[Int]](repeating: [Int](), count: n + 1)

for _  in 0 ..< n - 1 {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  edges[e[0]].append(e[1])
  edges[e[1]].append(e[0])
}

var parent = [Int](repeating: 0, count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
var q = [(Int, Int)](), front = 0

q.append((1, 1))

while front < q.count {
  let (pre, now) = q[front]
  front += 1
  
  parent[now] = pre
  
  for next in edges[now] {
    if !visited[next] {
      visited[next] = true
      q.append((now, next))
    }
  }
}

var answer = ""
for i in 2 ... n {
  answer += "\(parent[i])\n"
}

print(answer)
