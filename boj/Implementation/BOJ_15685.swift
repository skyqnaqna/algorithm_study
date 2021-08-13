/*
 백준 15685 드래곤 커브
 21.08.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var n = Int(readLine()!)!
let direction = [(0, 1), (-1, 0), (0, -1), (1, 0)] // (y, x)
var graph = [[Bool]](repeating: [Bool](repeating: false, count: 101), count:101)

while n > 0 {
  n -= 1

  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  var x = input[0], y = input[1], d = input[2], g = input[3]
  var path = [Int]()
  path.append(d)

  var end = (r: y + direction[d].0, c: x + direction[d].1)

  graph[y][x] = true
  graph[end.r][end.c] = true

  while g > 0 {
    g -= 1
    var curve = [Int]()
    for direct in path {
      var rotated = (direct + 1) % 4
      curve.append(rotated)
    }

    while !curve.isEmpty {
      let direct = curve.removeLast()
      let next = (r: end.r + direction[direct].0, c: end.c + direction[direct].1)
      path.append(direct)
      graph[next.r][next.c] = true
      end = next
    }
  }
}

var ans = 0
for i in 0 ..< 100 {
  for j in 0 ..< 100 {
    if graph[i][j] && graph[i+1][j] && graph[i][j+1] && graph[i+1][j+1] {
      ans += 1
    }
  }
}

print(ans)