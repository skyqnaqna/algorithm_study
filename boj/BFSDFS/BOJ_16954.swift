/*
 백준 16954 움직이는 미로 탈출
 21.08.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation
/*
 8초가 되면 모든 벽이 사라지는 것이 포인트
 벽이 존재할수 있는 최대 시간이 짧으므로 각 시간마다 벽이 위치하는 곳을 체크한다
 현재 시간, 위치에서 갈 수 있는 곳을 방문하면서 방문 기록을 체크하면 시간을 단축할 수 있다
 */

var graph = [[String]]()
var wallGraph = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 8), count: 8), count: 9)
var visited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 8), count: 8), count: 9)
var wall = [(Int, Int)]()
var ans = false
let end = (0, 7)

for i in 0 ..< 8 {
  graph.append(readLine()!.map { String($0) })

  for j in 0 ..< 8 {
    if graph[i][j] == "#" {
      wall.append((i, j))
    }
  }
}

// 시간별로 벽이 위치하는 곳 true
for (r, c) in wall {
  for t in 0 ..< 8 {
    if r + t < 8 {
      wallGraph[t][r + t][c] = true
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < 8 && 0 <= c && c < 8
}

var q = [(Int, Int, Int)](), front = 0
q.append((7, 0, 0))
visited[0][7][0] = true

while front < q.count {
  let now = q[front]
  let r = now.0
  let c = now.1
  let time = now.2
  front += 1

  if (r, c) == end || time > 7 {
    ans = true
    break
  }

  if wallGraph[time][r][c] {
    continue
  }

  for i in -1 ... 1 {
    for j in -1 ... 1 {
      let nr = r + i
      let nc = c + j

      if inBound(nr, nc) && !wallGraph[time][nr][nc] && !visited[time + 1][nr][nc] {
        q.append((nr, nc, time + 1))
        visited[time + 1][nr][nc] = true
      }
    }
  }
}

if ans {
  print(1)
} else {
  print(0)
}