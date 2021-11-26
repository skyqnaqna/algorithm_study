/*
 백준 6087 레이저 통신
 21.11.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let INF = Int(1e9)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let w = input[0], h = input[1]

var graph = [[String]](repeating: [String](), count: h)
var dist = [[Int]](repeating: [Int](repeating: INF, count: w), count: h)
var target = [(Int, Int)]()
var answer = INF

for i in 0 ..< h {
  graph[i] = readLine()!.map { String($0) }
  
  for j in 0 ..< w {
    if graph[i][j] == "C" {
      target.append((i, j))
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < h && 0 <= c && c < w && graph[r][c] != "*"
}

func bfs(_ row: Int, _ col: Int, _ d: Int) -> Int {
  var q = [(Int, Int, Int, Int)](), front = 0
  
  dist[row][col] = 0
  q.append((row, col, d, 0))
  
  while front < q.count {
    let (r, c, dir, cost) = q[front]
    front += 1
    
    if dist[r][c] < cost { continue }
    
    // 반대 방향은 한번에 갈 수 없으므로 패스
    // 거리(거울의 수)가 같아도 이전 방향에 따라 값이 달라질 수 있으므로 같은 경우도 다시 큐에 넣기
    for i in 0 ..< 4 {
      let nr = r + direction[i].0
      let nc = c + direction[i].1
      
      if !inBound(nr, nc) || abs(dir - i) == 2 { continue }
      
      if i == dir {
        if cost <= dist[nr][nc] {
          dist[nr][nc] = dist[r][c]
          q.append((nr, nc, i, cost))
        }
      } else {
        if cost + 1 <= dist[nr][nc] {
          dist[nr][nc] = cost + 1
          q.append((nr, nc, i, cost + 1))
        }
      }
    }
  }
  
  return dist[target[1].0][target[1].1]
}

// 시작점에서 네 방향에 대해 각각 bfs돌리기
for i in 0 ..< 4 {
  let r = target[0].0 + direction[i].0
  let c = target[0].1 + direction[i].1
  
  if !inBound(r,  c) { continue }
  
  dist = [[Int]](repeating: [Int](repeating: INF, count: w), count: h)
  dist[target[0].0][target[0].1] = 0
  
  answer = min(answer ,bfs(r, c, i))
}

print(answer)
