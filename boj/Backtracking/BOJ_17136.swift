/*
 백준 17136 색종이 붙이기
 21.12.05
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var graph = [[Int]](repeating: [Int](), count: 10)
var paper = [Int](repeating: 5, count: 6)
var answer = 100

for i in 0 ..< 10 {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < 10 && 0 <= c && c < 10
}

func checkArea(_ r: Int, _ c: Int, _ size: Int) -> Bool {
  for i in 0 ..< size {
    for j in 0 ..< size {
      if !inBound(r + i, c + j) || graph[r + i][c + j] == 0 { return false }
    }
  }
  
  return true
}

func fillArea(_ r: Int, _ c: Int, _ size: Int, _ n: Int) {
  for i in 0 ..< size {
    for j in 0 ..< size {
      graph[r + i][c + j] = n
    }
  }
}

func checkValid() -> Bool {
  for i in 0 ..< 10 {
    for j in 0 ..< 10 {
      if graph[i][j] == 1 { return false }
    }
  }
  return true
}

func recursive(_ n: Int, _ cnt: Int) {
  if answer < cnt { return }
  if n > 99 {
    if checkValid() {
      answer = min(answer, cnt)
    }
    
    return
  }
  
  let r = n / 10
  let c = n % 10
  
  if graph[r][c] == 1 {
    for k in stride(from: 5, to: 0, by: -1) {
      if paper[k] == 0 { continue }
      if checkArea(r, c, k) {
        paper[k] -= 1
        fillArea(r, c, k, 0)
        
        recursive(n + 1, cnt + 1)
        
        paper[k] += 1
        fillArea(r, c, k, 1)
      }
    }
  } else {
    recursive(n + 1, cnt)
  }
}

recursive(0, 0)

if answer < 100 {
  print(answer)
} else {
  print(-1)
}
