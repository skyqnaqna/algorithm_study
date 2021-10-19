/*
 21.10.20
 백준 4095 최대 정사각형
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var answer = ""

while true {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], m = input[1]
  
  if n == 0 && m == 0 { break }
  
  var graph = [[Int]](repeating: [Int](), count: n)
  var res = 0
  
  for i in 0 ..< n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for k in graph[i] {
      if k == 1 {
        res = 1
        break
      }
    }
  }
  
  for i in 1 ..< n {
    for j in 1 ..< m {
      if graph[i][j] > 0 {
        graph[i][j] = min(graph[i-1][j-1], min(graph[i][j-1], graph[i-1][j])) + 1
        
        res = max(res, graph[i][j])
      }
    }
  }
  
  answer += "\(res)\n"
}

print(answer)
