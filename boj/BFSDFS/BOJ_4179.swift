/*
 백준 4179 불!
 21.07.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let r = input[0], c = input[1]
var graph = [[String]](repeating: [String](), count: r)
var fireRoute = [[Int]](repeating: [Int](repeating: INF, count: c), count: r)
var exitRoute = [[Int]](repeating: [Int](repeating: INF, count: c), count: r)
var sr = 0, sc = 0
var fire = [(Int, Int, Int)]()

for i in 0 ..< r {
  graph[i] = readLine()!.map{ (String($0)) }

  for j in 0 ..< c {
    if graph[i][j] == "J" {
      sr = i
      sc = j
      exitRoute[i][j] = 0
    } else if graph[i][j] == "F" {
      fireRoute[i][j] = 0
      fire.append((0, i, j))
    }
  }
}

var idx = 0
while idx < fire.count {
  let (d, row, col) = fire[idx]
  idx += 1

  for (dy, dx) in direction {
    let nr = row + dy
    let nc = col + dx

    if nr < 0 || nc < 0 || nr >= r || nc >= c || graph[nr][nc] == "#" { continue }

    if fireRoute[nr][nc] == INF {
      fireRoute[nr][nc] = d + 1
      fire.append((d + 1, nr, nc))
    }
  }
}

idx = 0
var q = [(Int, Int, Int)]()
q.append((0, sr, sc))

while idx < q.count {
  let (d, row, col) = q[idx]
  idx += 1

  for (dy, dx) in direction {
    let nr = row + dy
    let nc = col + dx

    if nr < 0 || nc < 0 || nr >= r || nc >= c {
      print(d + 1)
      exit(0)
    }

    if graph[nr][nc] != "." || d + 1 >= fireRoute[nr][nc] || exitRoute[nr][nc] < INF { continue }

    exitRoute[nr][nc] = d + 1
    q.append((d + 1, nr, nc))
  }
}

print("IMPOSSIBLE")