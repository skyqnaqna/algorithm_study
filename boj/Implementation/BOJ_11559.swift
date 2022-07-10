/*
 백준 11559 Puyo Puyo
 22.07.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
var graph = [[Character]]()

for _ in 0 ..< 12 {
  graph.append(Array(readLine()!))
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < 12 && 0 <= c && c < 6
}

func moveToBottom(_ arr: inout [[Character]]) {
  for col in 0 ..< 6 {
    var cnt = 0
    
    for row in stride(from: 11, through: 0, by: -1) {
      if arr[row][col] == "." {
        cnt += 1
      } else {
        if cnt == 0 { continue }
        arr[row + cnt][col] = arr[row][col]
        arr[row][col] = "."
      }
    }
    
//    var row = 11
//    while 0 < row {
//      while 0 <= row && arr[row][col] != "." {
//        row -= 1
//      }
//
//      if row <= 0 { break }
//
//      var next = row - 1
//
//      while 0 <= next && arr[next][col] == "." {
//        next -= 1
//      }
//
//      if next < 0 { break }
//
//      arr[row][col] = arr[next][col]
//      arr[next][col] = "."
//
//      row -= 1
//    }
  }
}

func bfs(_ row: Int, _ col: Int, _ arr: inout [[Character]], _ isVisited: inout [[Bool]]) -> Int {
  let color = arr[row][col]
  isVisited[row][col] = true
  
  var q = [(Int, Int)](),
      front = 0,
      puyoList = [(Int, Int)]()
  
  q.append((row, col))
  
  while front < q.count {
    let (r, c) = q[front]
    front += 1
    
    puyoList.append((r, c))
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) { continue }
      if arr[nr][nc] != color { continue }
      if isVisited[nr][nc] { continue }
      
      isVisited[nr][nc] = true
      q.append((nr, nc))
    }
  }
  
  if 4 <= puyoList.count {
    for p in puyoList {
      arr[p.0][p.1] = "."
    }
    return 1
  } else { return 0 }
}


var answer = 0

while true {
  
  var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: 6), count: 12)
  var cnt = 0
  
  for i in stride(from: 11, through: 0, by: -1) {
    for j in 0 ..< 6 {
      if graph[i][j] != "." && !isVisited[i][j] {
        cnt += bfs(i, j, &graph, &isVisited)
      }
    }
  }
  
  if cnt > 0 {
    answer += 1
    moveToBottom(&graph)
  } else { break }
}

print(answer)

