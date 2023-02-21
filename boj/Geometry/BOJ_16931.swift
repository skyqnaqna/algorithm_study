/*
 백준 16931 겉넓이 구하기
 23.02.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]]()
var answer = n * m * 2

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< n ~= r && 0 ..< m ~= c
}

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for r in 0 ..< n {
  for c in 0 ..< m {
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx

      if !inBound(nr, nc) {
        answer += graph[r][c]
      } else if graph[nr][nc] < graph[r][c] {
        answer += graph[r][c] - graph[nr][nc]
      }
    }
  }
}

print(answer)
