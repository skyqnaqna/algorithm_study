/*
 백준 10711 모래성
 21.12.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (-1, 1), (1, -1), (1, 1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var sand = [(Int, Int)]()
var answer = 0

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

func countEmpty(_ r: Int, _ c: Int) -> Int {
  var res = 0
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if inBound(nr, nc) && graph[nr][nc] == 0 { res += 1 }
  }
  
  return res
}

for i in 0 ..< n {
  let row = readLine()!.map { String($0) }
  
  for j in 0 ..< m {
    if row[j] != "." {
      graph[i][j] = Int(row[j])!
    }
  }
}

for i in 0 ..< n {
  for j in 0 ..< m {
    if graph[i][j] <= countEmpty(i, j) {
        sand.append((i, j))
        visited[i][j] = true
    }
  }
}


while !sand.isEmpty {
  for (r, c) in sand {
    graph[r][c] = 0
  }
  
  var afterWave = [(Int, Int)]()
  
  for (r, c) in sand {
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) || graph[nr][nc] == 0 || visited[nr][nc] { continue }
      
      if graph[nr][nc] <= countEmpty(nr, nc) {
        afterWave.append((nr, nc))
        visited[nr][nc] = true
      }
    }
  }
  
  sand = afterWave
  
  answer += 1
}

print(answer)
