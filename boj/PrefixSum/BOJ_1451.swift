/*
 백준 1451 직사각형으로 나누기
 23.01.06
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]

var answer = 0
var graph = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: 1)

for i in 1 ... n {
  var row = [0]
  row += readLine()!.map { Int(String($0))! }

  graph.append(row)

  for j in 1 ... m {
    graph[i][j] += graph[i][j - 1]
  }
}

for j in 1 ... m {
  for i in 1 ... n {
    graph[i][j] += graph[i - 1][j]
  }
}

let total = graph[n][m]

func splitVertical(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
  let totalArea = graph[r2][c2] - graph[r1 - 1][c2] - graph[r2][c1 - 1] + graph[r1 - 1][c1 - 1]
  var maxVal = 0
  var area1 = 0, area2 = 0

  for c in c1 ..< c2 {
    area1 = graph[r2][c] - graph[r1 - 1][c] - graph[r2][c1 - 1] + graph[r1 - 1][c1 - 1]
    area2 = totalArea - area1

    maxVal = max(maxVal, area1 * area2)
  }

  return maxVal
}

func splitHorizontal(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
  let totalArea = graph[r2][c2] - graph[r1 - 1][c2] - graph[r2][c1 - 1] + graph[r1 - 1][c1 - 1]
  var maxVal = 0
  var area1 = 0, area2 = 0

  for r in r1 ..< r2 {
    area1 = graph[r][c2] - graph[r1 - 1][c2] - graph[r][c1 - 1] + graph[r1 - 1][c1 - 1]
    area2 = totalArea - area1

    maxVal = max(maxVal, area1 * area2)
  }

  return maxVal
}

var left = 0, right = 0

for c in 1 ..< m {
  left = graph[n][c]
  right = total - left

  let splitLeft1 = splitHorizontal(1, 1, n, c)
  let splitLeft2 = splitVertical(1, 1, n, c)
  let splitRight1 = splitHorizontal(1, c + 1, n, m)
  let splitRight2 = splitVertical(1, c + 1, n, m)

  answer = max(answer, max(left * splitRight1, right * splitLeft1))
  answer = max(answer, max(left * splitRight2, right * splitLeft2))
}

var up = 0, down = 0

for r in 1 ..< n {
  up = graph[r][m]
  down = total - up

  let splitUp1 = splitVertical(1, 1, r, m)
  let splitUp2 = splitHorizontal(1, 1, r, m)
  let splitDown1 = splitVertical(r + 1, 1, n, m)
  let splitDown2 = splitHorizontal(r + 1, 1, n, m)

  answer = max(answer, max(up * splitDown1, down * splitUp1))
  answer = max(answer, max(up * splitDown2, down * splitUp2))
}

print(answer)
