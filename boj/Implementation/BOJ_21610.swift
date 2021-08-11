/*
 백준 21610 마법사 상어와 비바라기
 21.08.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
var m = input[1]
let direction = [(0, 0), (0, -1), (-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1)]
let diagonal = [(-1, -1), (-1, 1), (1, -1), (1, 1)]
var graph = [[Int]]()
var cloud = [(Int, Int)]()
var used = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n
}

func copyMagic(_ r: Int, _ c: Int) -> Int {
  var cnt = 0

  for (dy, dx) in diagonal {
    let nr = r + dy
    let nc = c + dx

    if inBound(nr, nc) && graph[nr][nc] > 0 {
      cnt += 1
    }
  }

  return cnt
}

func move(_ r: Int, _ c: Int, _ d: Int, _ s: Int) -> (Int, Int) {
  var nr = r + direction[d].0 * s
  var nc = c + direction[d].1 * s

  if nr < 0 {
    nr %= n
    if nr < 0 { nr += n }
  } else if nr >= n {
    nr %= n
  }

  if nc < 0 {
    nc %= n
    if nc < 0 { nc += n }
  } else if nc >= n {
    nc %= n
  }

  if nr < 0 || nr >= n || nc < 0 || nc >= n {
    print(d, s, r, c, nr, nc)
  }
  return (nr, nc)
}

func createCloud() {
  for i in 0 ..< n {
    for j in 0 ..< n {
      if !used[i][j] && graph[i][j] >= 2 {
        cloud.append((i, j))
        graph[i][j] -= 2
      }
      used[i][j] = false
    }
  }
}

// 0. 초기 구름 생성
for i in n-2 ..< n {
  for j in 0 ..< 2 {
    cloud.append((i, j))
  }
}

while m > 0 {
  m -= 1
  let info = readLine()!.split(separator: " ").map { Int(String($0))! }
  let d = info[0], s = info[1]
// 1. 구름 이동
  for i in cloud.indices {
    cloud[i] = move(cloud[i].0, cloud[i].1, d, s)
  }
// 2. 비내리기
  for (r, c) in cloud {
    graph[r][c] += 1
    used[r][c] = true
  }
// 3. 구름 사라지기
// 4. 물복사 버그 마법
  cloud.sort(by: { graph[$0.0][$0.1] > graph[$1.0][$1.1] })
  for (r, c) in cloud {
    graph[r][c] += copyMagic(r, c)
  }
  cloud.removeAll()
// 5. 구름 생성
  createCloud()
}

var ans = 0
for row in graph {
  for val in row {
    ans += val
  }
}

print(ans)