/*
 백준 2638 치즈
 21.11.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

// 외부공기는 -1
var graph = [[Int]](repeating: [Int](), count: n)
var cheese = [(Int, Int)](), front = 0

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

// 외부공기가 통하는 곳을 새로 갱신해줌
func bfs(_ row: Int, _ col: Int) {
  var q = [(Int, Int)](), front = 0
  q.append((row, col))
  
  while front < q.count {
    let (r, c) = q[front]
    front += 1
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) { continue }
      
      if graph[nr][nc] == 0 {
        graph[nr][nc] = -1
        q.append((nr, nc))
      }
    }
  }
}

// 치즈가 녹으면서 추가된 공기흐름 탐색
func airFlow(_ newAir: [(Int, Int)]) {
  for pos in newAir {
    graph[pos.0][pos.1] = -1
    bfs(pos.0, pos.1)
  }
}

// 치즈가 공기와 접촉한 면의 수 구하기
func checkAround(_ r: Int, _ c: Int) -> Int {
  var cnt = 0
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if graph[nr][nc] == -1 {
      cnt += 1
    }
  }
  
  return cnt
}

func solution() -> Int {
  var round = 0
  
  for i in 0 ..< n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for j in 0 ..< m {
      if graph[i][j] == 1 {
        cheese.append((i, j))
      }
    }
  }
  
  graph[0][0] = -1
  bfs(0, 0)
  
  while front < cheese.count {
    round += 1
    
    // 기존 치즈의 개수만큼 살펴보면서 현재 round에 녹을 치즈 구하기
    let size = cheese.count - front
    var meltedCheese = [(Int, Int)]()
    
    for _ in 0 ..< size {
      let (r, c) = cheese[front]
      front += 1
      
      if checkAround(r, c) >= 2 {
        meltedCheese.append((r, c))
      } else {
        cheese.append((r, c))
      }
    }
    
    if !meltedCheese.isEmpty {
      airFlow(meltedCheese)
    }
  }
  
  return round
}

print(solution())

