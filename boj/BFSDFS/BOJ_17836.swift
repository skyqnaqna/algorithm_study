/*
 백준 17836 공주님을 구해라!
 21.11.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(2e9)
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], t = input[2]

var gram = (-1, -1)

var graph = [[Int]](repeating: [Int](), count: n),
    dist = [[Int]](repeating: [Int](repeating: INF, count: m), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in 0 ..< m {
    if graph[i][j] == 2 {
      gram = (i, j)
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m && graph[r][c] != 1
}

dist[0][0] = 0
var q = [(Int, Int, Int)](), front = 0
q.append((0, 0, 0))

while front < q.count {
  let (r, c, w) = q[front]
  front += 1
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if !inBound(nr, nc) { continue }
    
    if dist[nr][nc] == INF {
      dist[nr][nc] = w + 1
      q.append((nr, nc, w + 1))
    }
  }
}

let answer = min(dist[n-1][m-1], dist[gram.0][gram.1] + n - 1 - gram.0 + m - 1 - gram.1)

if answer > t || answer == INF {
  print("Fail")
} else {
  print(answer)
}
