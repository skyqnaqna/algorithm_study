/*
 백준 13565 침투
 23.01.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let m = input[0], n = input[1]

var graph = [[Int]]()
var isVisted = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)

for _ in 0 ..< m {
  graph.append(readLine()!.map { Int(String($0))! })
}

var answer = "NO"
var q = [(Int, Int)]()
var front = 0

for i in 0 ..< n {
  if graph[0][i] == 0 {
    q.append((0, i))
    isVisted[0][i] = true
  }
}

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< m ~= r && 0 ..< n ~= c
}

while front < q.count {
  let (r, c) = q[front]
  front += 1

  if r == m - 1 {
    answer = "YES"
    break
  }

  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx

    if !inBound(nr, nc) || graph[nr][nc] == 1 || isVisted[nr][nc] { continue }

    q.append((nr, nc))
    isVisted[nr][nc] = true
  }
}

print(answer)
