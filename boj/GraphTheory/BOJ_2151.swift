/*
 백준 2151 거울 설치
 23.02.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

let n = Int(readLine()!)!
var answer = n * n
var graph = [[String]]()
var doors = [(Int, Int)]()

for i in 0 ..< n {
  graph.append(readLine()!.map { String($0) })

  for j in 0 ..< n {
    if graph[i][j] == "#" {
      doors.append((i, j))
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< n ~= r && 0 ..< n ~= c
}

var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: n * n,
                                                                 count: 4),
                                               count: n),
                           count: n)

var q = [(Int, Int, Int, Int)]() // r, c, cnt, dir
var front = 0

for i in 0 ..< 4 {
  q.append((doors[0].0, doors[0].1, 0, i))
}

while front < q.count {
  let (r, c, cnt, dir) = q[front]
  front += 1

  var nr = r + direction[dir].0
  var nc = c + direction[dir].1

  while inBound(nr, nc) && graph[nr][nc] == "." {
    nr += direction[dir].0
    nc += direction[dir].1
  }

  if !inBound(nr, nc) || graph[nr][nc] == "*" { continue }

  if graph[nr][nc] == "!" {
    if cnt + 1 < dist[nr][nc][(dir + 1) % 4] {
      dist[nr][nc][(dir + 1) % 4] = cnt + 1
      q.append((nr, nc, cnt + 1, (dir + 1) % 4))
    }

    if cnt + 1 < dist[nr][nc][(dir + 3) % 4] {
      dist[nr][nc][(dir + 3) % 4] = cnt + 1
      q.append((nr, nc, cnt + 1, (dir + 3) % 4))
    }
  }

  // 거울을 배치 안 하는 경우도 고려
  if cnt < dist[nr][nc][dir] {
    dist[nr][nc][dir] = cnt
    q.append((nr, nc, cnt, dir))
  }
}

print(dist[doors[1].0][doors[1].1].min()!)
