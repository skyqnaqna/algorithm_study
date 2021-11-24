/*
 백준 1726 로봇
 21.11.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)
// 동, 남, 서, 북
let direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]
// direction의 방위 인덱스 반환 (동쪽 1 -> 0 )
let bearing = [1: 0, 2: 2, 3: 1, 4: 3]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: 4), count: m), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

let start = readLine()!.split(separator: " ").map { Int(String($0))! }
let end = readLine()!.split(separator: " ").map { Int(String($0))! }

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m && graph[r][c] == 0
}

// 정반대는 2번 회전, 나머지는 1번 회전
func getTurn(_ from: Int, _ to: Int) -> Int {
  if abs(from - to) != 2 { return 1 }
  else { return 2 }
}

func bfs() {
  var q = [(Int, Int, Int, Int)](), front = 0
  
  q.append((start[0] - 1, start[1] - 1, 0, bearing[start[2]]!))
  dist[start[0] - 1][start[1] - 1][bearing[start[2]]!] = 0
  
  while front < q.count {
    let (r, c, cost, dir) = q[front]
    front += 1
    
    if dist[r][c][dir] < cost { continue }
    
    for i in 0 ..< 4 {
      // 같은 방향일 때
      if i == dir {
        for j in 1 ... 3 {
          let nr = r + direction[i].0 * j
          let nc = c + direction[i].1 * j
          
          if !inBound(nr, nc) { break }
          
          if cost + 1 < dist[nr][nc][i] {
            dist[nr][nc][i] = cost + 1
            q.append((nr, nc, cost + 1, i))
          }
        }
      } else {
        // 다른 방향은 회전만 해줌
        let diff = getTurn(dir, i)
        if cost + diff < dist[r][c][i] {
          dist[r][c][i] = cost + diff
          q.append((r, c, cost + diff, i))
        }
      }
    }
  }
}

bfs()

print(dist[end[0] - 1][end[1] - 1][bearing[end[2]]!])

// debug
//for k in 0 ..< 4 {
//  print("dir : \(k)")
//  for i in 0 ..< n {
//    for j in 0 ..< m {
//      if dist[i][j][k] == INF {
//        print("-", terminator: " ")
//      } else {
//        print(dist[i][j][k], terminator: " ")
//      }
//    }
//    print()
//  }
//  print("==============")
//}
