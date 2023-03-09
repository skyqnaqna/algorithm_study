/*
 백준 17135 캐슬 디펜스
 23.03.09
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], d = input[2]
let direction = [(0, -1), (-1, 0), (0, 1)]

var graph = [[Int]]()
var answer = 0

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var archerPositions = [[Int]]()
var isChecked = [Bool](repeating: false, count: m)

func makePosition(_ idx: Int, _ cnt: Int, _ pos: [Int]) {
  if cnt == 3 {
    archerPositions.append(pos)
    return
  }

  for i in idx ..< m {
    if isChecked[i] { continue }

    isChecked[i] = true
    makePosition(i + 1, cnt + 1, pos + [i])
    isChecked[i] = false
  }
}

makePosition(0, 0, [])

func bfs(_ row: Int, _ col: Int, _ arr: inout [[Int]]) -> (Int, Int)? {
  var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: row + 1)
  var q = [(Int, Int, Int)](), front = 0

  isVisited[row][col] = true
  q.append((row, col, 1))

  while front < q.count {
    let (r, c, dist) = q[front]
    front += 1

    if d < dist { break }
    if arr[r][c] == 1 { return (r, c) }

    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx

      if nr < 0 || nc < 0 || m <= nc || isVisited[nr][nc] { continue }

      isVisited[nr][nc] = true
      q.append((nr, nc, dist + 1))
    }
  }

  return nil
}

var tempGraph = [[Int]]()

for pos in archerPositions {
  tempGraph = graph
  var cnt = 0

  for row in stride(from: n, to: 0, by: -1) {
    var target = [(Int, Int)]()

    for col in pos {
      if let res = bfs(row - 1, col, &tempGraph) {
        target.append(res)
      }
    }

    for (r, c) in target {
      if tempGraph[r][c] == 1 {
        cnt += 1
        tempGraph[r][c] = 0
      }
    }
  }

  answer = max(answer, cnt)
}

print(answer)
