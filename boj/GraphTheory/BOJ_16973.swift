/*
 백준 16973 직사각형 탈출
 21.12.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var graph = [[Int]](repeating: [Int](), count: n)
var dist = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

let rectangle = readLine()!.split(separator: " ").map { Int(String($0))! }
let h = rectangle[0], w = rectangle[1], sr = rectangle[2] - 1, sc = rectangle[3] - 1, fr = rectangle[4] - 1, fc = rectangle[5] - 1

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m && graph[r][c] == 0
}

func checkMove(_ r: Int, _ c: Int, _ dir: Int) -> Bool {
  switch dir {
  case 0:
    for j in 0 ..< w {
      if !inBound(r, c + j) { return false }
    }
  case 1:
    for j in 0 ..< w {
      if !inBound(r + h - 1, c + j) { return false }
    }
  case 2:
    for i in 0 ..< h {
      if !inBound(r + i, c) { return false }
    }
  case 3:
    for i in 0 ..< h {
      if !inBound(r + i, c + w - 1) { return false }
    }
  default:
    return false
  }
  return true
}

var q = [(Int, Int)](), front = 0
dist[sr][sc] = 0
q.append((sr, sc))

while front < q.count {
  let (r, c) = q[front]
  front += 1
  
  if r == fr && c == fc { break }
  
  for i in direction.indices {
    let nr = r + direction[i].0
    let nc = c + direction[i].1
    
    if !inBound(nr, nc) || dist[nr][nc] != -1 { continue }
    
    if checkMove(nr, nc, i) {
      q.append((nr, nc))
      dist[nr][nc] = dist[r][c] + 1
    }
  }
}

print(dist[fr][fc])
