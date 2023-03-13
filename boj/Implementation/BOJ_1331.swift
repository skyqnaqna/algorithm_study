/*
 백준 1331 나이트 투어
 23.03.13
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var history = [String]()
var cnt = [String: Int]()

let direction = [(-2, 1), (-2, -1), (-1, 2), (1, 2), (2, 1), (2, -1), (-1, -2), (1, -2)]
let column = "ABCDEF".map { String($0) }
var graph = [[String]](repeating: [String](repeating: "", count: 6), count: 6)

for _ in 0 ..< 36 {
  let i = readLine()!
  history.append(i)
  cnt[i, default: 0] += 1
}

var row = 0, col = 0

for i in 0 ..< 6 {
  for j in 0 ..< 6 {
    graph[i][j] = "\(column[j])\(6 - i)"
    if graph[i][j] == history[0] {
      row = i
      col = j
    }
  }
}

var isValid = true

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< 6 ~= r && 0 ..< 6 ~= c
}

history.append(history[0])

for i in 1 ... 36 {
  if let count = cnt[history[i]], count > 1 {
    isValid = false
    break
  }

  let pre = (row, col)

  for (dy, dx) in direction {
    let nr = row + dy
    let nc = col + dx

    if !inBound(nr, nc) { continue }
    if graph[nr][nc] == history[i] {
      row = nr
      col = nc
      break
    }
  }

  if pre == (row, col) {
    isValid = false
    break
  }
}

print(isValid ? "Valid" : "Invalid")
