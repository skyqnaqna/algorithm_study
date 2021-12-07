/*
 백준 16973 직사각형 탈출
 21.12.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var graph = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
var dist = [[Int]](repeating: [Int](repeating: -1, count: m + 1), count: n + 1)

for i in 1 ... n {
  let row = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in 1 ... m {
    graph[i][j] = row[j - 1]
    prefixSum[i][j] = prefixSum[i][j - 1] + row[j - 1]
  }
}

for j in 1 ... m {
  for i in 2 ... n {
    prefixSum[i][j] += prefixSum[i - 1][j]
  }
}

let rectangle = readLine()!.split(separator: " ").map { Int(String($0))! }
let h = rectangle[0], w = rectangle[1], sr = rectangle[2], sc = rectangle[3], fr = rectangle[4], fc = rectangle[5]

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 < r && r <= n && 0 < c && c <= m && graph[r][c] == 0
}

func checkMove(_ r: Int, _ c: Int) -> Bool {
  let r2 = r + h - 1, c2 = c + w - 1
  
  if !inBound(r2, c2) { return false }
  
  let area = prefixSum[r2][c2] - prefixSum[r - 1][c2] - prefixSum[r2][c - 1] + prefixSum[r - 1][c - 1]
  
  return area == 0
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
    
    if checkMove(nr, nc) {
      q.append((nr, nc))
      dist[nr][nc] = dist[r][c] + 1
    }
  }
}

print(dist[fr][fc])
