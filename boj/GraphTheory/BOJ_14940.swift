/*
 백준 14940 쉬운 최단거리
 21.11.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var start = (0, 0)

for i in 0 ..< n {
  let row = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in 0 ..< m {
    if row[j] == 0 {
      graph[i][j] = 0
    }
    if row[j] == 2 {
      start = (i, j)
      graph[i][j] = 0
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

var q = [(Int, Int, Int)](), front = 0

q.append((start.0, start.1, 0))

while front < q.count {
  let (r, c, w) = q[front]
  front += 1
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if !inBound(nr, nc) { continue }
    
    if graph[nr][nc] == -1 {
      graph[nr][nc] = w + 1
      q.append((nr, nc, w + 1))
    }
  }
}

var answer = ""
for i in 0 ..< n {
  answer += graph[i].map { String($0) }.joined(separator: " ") + "\n"
}

print(answer)
