/*
 백준 2098 외판원 순회
 22.01.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(2e9)

let n = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](), count: n)
var dp = [[Int]](repeating: [Int](repeating: -1, count: 1 << n), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func traveling(_ now: Int, _ visited: Int) -> Int {
  if dp[now][visited] != -1 { return dp[now][visited] }
  if visited == ((1 << n) - 1) {
    if graph[now][0] == 0 { return INF }
    else { return graph[now][0] }
  }
  
  var res = INF
  
  for next in 0 ..< n {
    if (visited & (1 << next)) != 0 || graph[now][next] == 0 { continue }
    
    res = min(res, graph[now][next] + traveling(next, visited | (1 << next)))
  }
  
  dp[now][visited] = res
  
  return res
}

print(traveling(0, 1 << 0))
