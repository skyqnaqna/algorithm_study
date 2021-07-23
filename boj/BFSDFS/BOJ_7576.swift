/*
 백준 7576 토마토
 21.07.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[1], m = input[0]

var graph = [[Int]](repeating: [Int](), count: n)
var days = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var tomato = [(Int, Int, Int)]()

var remain = 0
for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }

  for j in 0 ..< m {
    if graph[i][j] == 1 {
      tomato.append((0, i, j))
      days[i][j] = 0
    } else if graph[i][j] == 0 {
      remain += 1
    }
  }
}

var idx = 0, ans = 0
while idx < tomato.count {
  let (day, r, c) = tomato[idx]
  idx += 1

  ans = max(ans, day)

  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx

    if nr < 0 || nc < 0 || nr >= n || nc >= m { continue }

    if graph[nr][nc] == 0 && days[nr][nc] == -1 {
      days[nr][nc] = day + 1
      tomato.append((day + 1, nr, nc))
      remain -= 1
    }
  }
}

if remain > 0 {
  print(-1)
} else {
  print(ans)
}