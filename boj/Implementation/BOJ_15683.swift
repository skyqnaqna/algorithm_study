/*
 백준 15683 감시
 21.12.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(1, 0), (0, 1), (-1, 0), (0, -1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var cctv = [(Int, Int)]()
var monitoringWay = [0, 4, 2, 4, 4, 1]
var answer = Int(1e9)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in 0 ..< m {
    if graph[i][j] > 0 && graph[i][j] < 6 {
      cctv.append((i, j))
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m && graph[r][c] != 6
}

func getBlindSpot() -> Int {
  var res = 0
  
  for i in 0 ..< n {
    for j in 0 ..< m {
      if !visited[i][j] && graph[i][j] != 6 { res += 1 }
    }
  }
  
  return res
}

func checkMonitoring(_ r: Int, _ c: Int, _ num: Int, _ d: Int) {
  visited[r][c] = true
  var nr = r + direction[d].0
  var nc = c + direction[d].1
  
  switch num {
  case 1:
    while inBound(nr, nc) {
      visited[nr][nc] = true
      nr += direction[d].0
      nc += direction[d].1
    }
  case 2:
    while inBound(nr, nc) {
      visited[nr][nc] = true
      nr += direction[d].0
      nc += direction[d].1
    }
    
    nr = r + direction[d + 2].0
    nc = c + direction[d + 2].1
    
    while inBound(nr, nc) {
      visited[nr][nc] = true
      nr += direction[d + 2].0
      nc += direction[d + 2].1
    }
  case 3:
    while inBound(nr, nc) {
      visited[nr][nc] = true
      nr += direction[d].0
      nc += direction[d].1
    }
    
    nr = r + direction[(d + 1) % 4].0
    nc = c + direction[(d + 1) % 4].1
    
    while inBound(nr, nc) {
      visited[nr][nc] = true
      nr += direction[(d + 1) % 4].0
      nc += direction[(d + 1) % 4].1
    }
  case 4:
    for i in 0 ..< 4 {
      if i == d { continue }
      
      nr = r + direction[i].0
      nc = c + direction[i].1
      
      while inBound(nr, nc) {
        visited[nr][nc] = true
        nr += direction[i].0
        nc += direction[i].1
      }
    }
  case 5:
    for (dy, dx) in direction {
      nr = r + dy
      nc = c + dx
      
      while inBound(nr, nc) {
        visited[nr][nc] = true
        nr += dy
        nc += dx
      }
    }
  default:
    return
  }
}

func recursive(_ idx: Int, _ arr: [Int]) {
  if idx == cctv.count {
    for i in arr.indices {
      let r = cctv[i].0
      let c = cctv[i].1
      let num = graph[r][c]
      let dir = arr[i]
      
      checkMonitoring(r, c, num, dir)
    }
    
    let result = getBlindSpot()
    
    answer = min(answer, result)
    visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    return
  }
  
  let row = cctv[idx].0
  let col = cctv[idx].1
  
  for i in 0 ..< monitoringWay[graph[row][col]] {
    recursive(idx + 1, arr + [i])
  }
}

recursive(0, [])

print(answer)
