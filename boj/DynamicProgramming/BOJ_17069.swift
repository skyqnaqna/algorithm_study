/*
 백준 17069 파이프 옮기기 2
 22.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]]()
// 0: 가로, 1: 세로, 2: 대각선
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: n), count: n)

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

dp[0][1][0] = 1

for r in 0 ..< n {
  for c in 1 ..< n {
    if dp[r][c][0] != 0 {
      if c + 1 < n && graph[r][c + 1] == 0 {
        dp[r][c + 1][0] += dp[r][c][0]
      }
      
      if r + 1 < n && c + 1 < n && graph[r + 1][c + 1] == 0 && graph[r][c + 1] == 0 && graph[r + 1][c] == 0 {
        dp[r + 1][c + 1][2] += dp[r][c][0]
      }
    }
    
    if dp[r][c][1] != 0 {
      if r + 1 < n && graph[r + 1][c] == 0 {
        dp[r + 1][c][1] += dp[r][c][1]
      }
      
      if r + 1 < n && c + 1 < n && graph[r + 1][c + 1] == 0 && graph[r][c + 1] == 0 && graph[r + 1][c] == 0 {
        dp[r + 1][c + 1][2] += dp[r][c][1]
      }
    }
    
    if dp[r][c][2] != 0 {
      if c + 1 < n && graph[r][c + 1] == 0 {
        dp[r][c + 1][0] += dp[r][c][2]
      }
      
      if r + 1 < n && graph[r + 1][c] == 0 {
        dp[r + 1][c][1] += dp[r][c][2]
      }
      
      if r + 1 < n && c + 1 < n && graph[r + 1][c + 1] == 0 && graph[r][c + 1] == 0 && graph[r + 1][c] == 0 {
        dp[r + 1][c + 1][2] += dp[r][c][2]
      }
    }
  }
}

print(dp[n - 1][n - 1].reduce(0, +))

