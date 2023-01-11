/*
 백준 16173 점프왕 쩰리 (Small)
 23.01.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]]()

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var answer = "Hing"

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n
}

func recursive(_ r: Int, _ c: Int) {
  if graph[r][c] == -1 {
    answer = "HaruHaru"
    return
  }

  for (dy, dx) in [(0, 1), (1, 0)] {
    if graph[r][c] == 0 { continue }

    let nr = r + dy * graph[r][c]
    let nc = c + dx * graph[r][c]

    if !inBound(nr, nc) { continue }

    recursive(nr, nc)
  }
}

recursive(0, 0)

print(answer)
