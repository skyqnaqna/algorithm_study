/*
 백준 20419 화살표 미로 (Easy)
 22.05.20
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

// U, R, D, L
let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], k = input[2]

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var dist = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

for i in 0 ..< n {
  let row = readLine()!.map { String($0) }
  
  for j in 0 ..< m {
    switch row[j] {
    case "R":
      graph[i][j] = 1
    case "D":
      graph[i][j] = 2
    case "L":
      graph[i][j] = 3
    default:
      continue
    }
  }
}

var answer = false
var q = [(Int, Int, Int, Int)]() // r, c, L, R
var front = 0

q.append((0, 0, k, k))
dist[0][0] = 0

while front < q.count {
  let (r, c, L, R) = q[front]
  front += 1
  
  let d = graph[r][c]
  
  if r == n - 1 && c == m - 1 {
    answer = true
    break
  }
  
  var nr = r + direction[d].0,
      nc = c + direction[d].1
  
  if inBound(nr, nc) && (dist[nr][nc] == -1 || dist[r][c] < dist[nr][nc]) {
    dist[nr][nc] = dist[r][c]
    q.append((nr, nc, L, R))
  }
  
  if 0 < L {
    nr = r + direction[(d + 3) % 4].0
    nc = c + direction[(d + 3) % 4].1
    
    if inBound(nr, nc) && (dist[nr][nc] == -1 || dist[r][c] + 1 < dist[nr][nc]) {
      dist[nr][nc] = dist[r][c] + 1
      q.append((nr, nc, L - 1, R))
    }
  }
  
  if 0 < R {
    nr = r + direction[(d + 1) % 4].0
    nc = c + direction[(d + 1) % 4].1
    
    if inBound(nr, nc) && (dist[nr][nc] == -1 || dist[r][c] + 1 < dist[nr][nc]) {
      dist[nr][nc] = dist[r][c] + 1
      q.append((nr, nc, L, R - 1))
    }
  }
}

if answer {
  print("Yes")
} else {
  print("No")
}
