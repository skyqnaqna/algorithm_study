/*
 백준 2210 숫자판 점프
 23.02.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var graph = [[String]]()
var numSet = Set<String>()

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

for _ in 0 ..< 5 {
  graph.append(readLine()!.split(separator: " ").map { String($0) })
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< 5 ~= r && 0 ..< 5 ~= c
}

func recursive(_ r: Int, _ c: Int, _ cnt: Int, _ number: String) {
  if cnt == 5 {
    numSet.insert(number)
    return
  }

  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx

    if !inBound(nr, nc) { continue }

    recursive(nr, nc, cnt + 1, number + graph[nr][nc])
  }
}

for i in 0 ..< 5 {
  for j in 0 ..< 5 {
    recursive(i, j, 0, graph[i][j])
  }
}

print(numSet.count)
