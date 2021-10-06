/*
 21.10.06
 백준 13424 비밀 모임
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)

var t = Int(readLine()!)!
var answer = ""

while t > 0 {
  t -= 1
  
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], m = input[1]
  
  var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)
  
  for _ in 0 ..< m {
    let e = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    graph[e[0]][e[1]] = e[2]
    graph[e[1]][e[0]] = e[2]
  }
  
  for k in 1 ... n {
    for i in 1 ... n {
      for j in 1 ... n {
        if i == j {
          graph[i][j] = 0
          continue
        }
        
        if graph[i][k] + graph[k][j] < graph[i][j] {
          graph[i][j] = graph[i][k] + graph[k][j]
        }
      }
    }
  }
  
  let _ = Int(readLine()!)!
  let friends = readLine()!.split(separator: " ").map { Int(String($0))! }
  var minDist = INF, num = 0
  
  for i in 1 ... n {
    var dist = 0
    for j in friends {
      dist += graph[j][i]
    }
    
    if dist < minDist {
      minDist = dist
      num = i
    }
  }
  
  answer += "\(num)\n"
}

print(answer)
