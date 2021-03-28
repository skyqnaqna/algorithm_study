// 백준 9250 맥주 마시면서 걸어가기
// 21.03.28

import Foundation

var t = Int(readLine()!)!
let INF = Int(1e9)

while t > 0 {
  t -= 1
  
  let n = Int(readLine()!)!
  var xy = [(Int, Int)]()
  var graph = [[Bool]](repeating: [Bool](repeating: false, count: n + 2), count: n + 2)
  
  for _ in 0..<n + 2 {
    let x = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    xy.append((x[0], x[1]))
  }
  
  for i in stride(from: 0, to: n + 2, by: 1) {
    for j in stride(from: i + 1, to: n + 2, by: 1) {
      let dist = abs(xy[i].0 - xy[j].0) + abs(xy[i].1 - xy[j].1)
      if dist <= 1000 {
        graph[i][j] = true
        graph[j][i] = true
      }
    }
    
    for k in 1..<n + 1 {
      for i in 0..<n + 2{
        if !graph[i][k] { continue }
        for j in 0..<n + 2{
          if !graph[k][j] { continue }
          else { graph[i][j] = true }
        }
      }
    }
  }
  if graph[0][n+1] { print("happy") }
  else { print("sad") }
}
