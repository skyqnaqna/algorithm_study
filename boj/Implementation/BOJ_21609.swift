/*
 백준 21609 상어 중학교
 23.03.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

var answer = 0
var graph = [[Int]]()

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< n ~= r && 0 ..< n ~= c
}

func bfs(_ row: Int, _ col: Int, _ isVisited: inout [[[Bool]]]) -> [(Int, Int)] {
  let target = graph[row][col]

  var q = [(Int, Int)](), front = 0
  var res = [(Int, Int)]()
  var rainbow = 0

  q.append((row, col))
  isVisited[target][row][col] = true

  while front < q.count {
    let (r, c) = q[front]
    front += 1

    res.append((r, c))

    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx

      if !inBound(nr, nc) || isVisited[target][nr][nc] || graph[nr][nc] < 0 {
        continue
      }

      if graph[nr][nc] > 0 && graph[nr][nc] != target { continue }

      q.append((nr, nc))

      if graph[nr][nc] == 0 { rainbow += 1 }

      isVisited[target][nr][nc] = true
    }
  }

  res.append((rainbow, 0))

  return res
}

func removeBlock(_ blocks: [(Int, Int)]) {
  for i in 0 ..< blocks.count - 1 {
    let r = blocks[i].0
    let c = blocks[i].1

    graph[r][c] = -2
  }
}

func dropBlock() {
  for i in stride(from: n - 1, to: 0, by: -1) {
    (0 ..< n).forEach { j in
      if graph[i][j] != -2 { return }

      var next = i

      while next - 1 >= 0 && graph[next - 1][j] == -2 { next -= 1 }

      if next == 0 || graph[next - 1][j] < 0 { return }

      graph[i][j] = graph[next - 1][j]
      graph[next - 1][j] = -2
    }
  }
}

func rotateBoard() {

  var r1 = 0, c1 = 0, r2 = n - 1, c2 = n - 1
  var size = n

  while size > 1 {

    for k in 0 ..< size - 1 {
      let temp = graph[r1][c1 + k]

      graph[r1][c1 + k] = graph[r1 + k][c2]
      graph[r1 + k][c2] = graph[r2][c2 - k]
      graph[r2][c2 - k] = graph[r2 - k][c1]
      graph[r2 - k][c1] = temp
    }

    size -= 2
    r1 += 1
    c1 += 1
    r2 -= 1
    c2 -= 1
  }
}

while true {
  var group = [[(Int, Int)]]()
  var isVisited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: n), count: n), count: m + 1)

  for i in 0 ..< n {
    for j in 0 ..< n {
      if graph[i][j] > 0 && !isVisited[graph[i][j]][i][j] {
        group.append(bfs(i, j, &isVisited))
      }
    }
  }

  if group.isEmpty { break }

  group.sort(by: {
    if $0.count == $1.count {
      if $0.last!.0 == $1.last!.0 {
        if $0[0].0 == $1[0].0 {
          return $0[0].1 < $1[0].1
        } else {
          return $0[0].0 < $1[0].0
        }
      } else {
        return $0.last!.0 < $1.last!.0
      }
    } else {
      return $0.count < $1.count
    }
  })

  if group.last!.count < 3 { break }

  let b = group.last!.count - 1
  answer += b * b

  removeBlock(group.removeLast())
  dropBlock()
  rotateBoard()
  dropBlock()
}

print(answer)
