/*
 프로그래머스 거리두기 확인하기
 22.05.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < 5 && 0 <= c && c < 5
}

func getDistance(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
  return abs(r1 - r2) + abs(c1 - c2)
}

func solution(_ places:[[String]]) -> [Int] {
  let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
  var answer = [Int]()
  var graph = [[String]](repeating: [String](), count: 5)
  
  func bfs(_ row: Int, _ col: Int, _ toRow: Int, _ toCol: Int) -> Int {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
    var q = [(Int, Int, Int)](), front = 0
    q.append((row, col, 0))
    
    while front < q.count {
      let (r, c, d) = q[front]
      front += 1
      
      if r == toRow && c == toCol {
        return d
      }
      
      for (dy, dx) in direction {
        let nr = r + dy
        let nc = c + dx
        
        if !inBound(nr, nc) || graph[nr][nc] == "X" || visited[nr][nc] { continue }
        
        visited[nr][nc] = true
        q.append((nr, nc, d + 1))
      }
    }
    
    return 100
  }
  
  for place in places {
    var position = [(Int, Int)]()
    var res = true
    
    for i in 0 ..< 5 {
      graph[i] = place[i].map { String($0) }
      
      for j in 0 ..< 5 {
        if graph[i][j] == "P" {
          position.append((i, j))
        }
      }
    }
    
    if position.count > 1 {
      for i in 0 ..< position.count - 1 {
        if !res { break }
        let (r1, c1) = position[i]
        for j in i + 1 ..< position.count {
          if !res { break }
          let (r2, c2) = position[j]
          
          if getDistance(r1, c1, r2, c2) <= 2 {
            let realDist = bfs(r1, c1, r2, c2)
            
            res = realDist <= 2 ? false : true
          }
        }
      }
    }
    
    if res {
      answer.append(1)
    } else {
      answer.append(0)
    }
  }
  
  return answer
}

print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]  ))
