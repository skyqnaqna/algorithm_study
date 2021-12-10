/*
 백준 2573 빙산
 21.12.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var ice = [(Int, Int)]()
var year = 0

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in 0 ..< m {
    if graph[i][j] > 0 {
      ice.append((i, j))
    }
  }
}

func inBound(_ r: Int, _ c : Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

func countSeawater(_ r: Int, _ c: Int) -> Int {
  var res = 0
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if !inBound(nr, nc) { continue }
    if graph[nr][nc] == 0 { res += 1 }
  }
  
  return res
}

func checkLump(_ r: Int, _ c: Int) {
  var q = [(Int, Int)](), front = 0
  q.append((r, c))
  visited[r][c] = true
  
  while front < q.count {
    let (row, col) = q[front]
    front += 1
    
    for (dy, dx) in direction {
      let nr = row + dy
      let nc = col + dx
      
      if !inBound(nr, nc) || graph[nr][nc] == 0 { continue }
      
      if !visited[nr][nc] {
        visited[nr][nc] = true
        q.append((nr, nc))
      }
    }
  }
}

var valid = false
while !ice.isEmpty {
  var lumpOfIce = 0
  for (r, c) in ice {
    if !visited[r][c] {
      lumpOfIce += 1
      checkLump(r, c)
    }
  }
  
  if lumpOfIce > 1 {
    valid = true
    break
  }
  
  year += 1
  
  var afterMelting = [(Int, Int)]()
  var melted = [(Int, Int)]()
  
  for (r, c) in ice {
    let diff = countSeawater(r, c)
    
    if graph[r][c] - diff <= 0 {
      melted.append((r, c))
    } else {
      graph[r][c] -= diff
      afterMelting.append((r, c))
    }
  }
  
  ice = afterMelting
  
  for (r, c) in melted {
    graph[r][c] = 0
  }
  
  visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
}

if valid {
  print(year)
} else {
  print(0)
}

