/*
 백준 1913 달팽이
 22.11.09
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let target = Int(readLine()!)!

var answer = (0, 0)
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

let direction = [(1, 0), (0, 1), (-1, 0), (0, -1)]

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n
}

var now = n * n
var dir = 0
var r = 0, c = 0

while now > 0 {
  graph[r][c] = now

  if now == target {
    answer = (r + 1, c + 1)
  }

  var nr = r + direction[dir].0
  var nc = c + direction[dir].1

  if !inBound(nr, nc) || graph[nr][nc] != 0 {
    dir = (dir + 1) % 4

    nr = r + direction[dir].0
    nc = c + direction[dir].1
  }

  r = nr
  c = nc
  now -= 1
}


for i in 0 ..< n {
  print(graph[i].map { String($0) }.joined(separator: " "))
}

print(answer.0, answer.1)
