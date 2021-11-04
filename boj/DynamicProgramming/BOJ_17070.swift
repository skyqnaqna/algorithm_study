/*
 백준 17070 파이프 옮기기 1
 21.11.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: n), count: n)

dp[0][1][0] = 1

for i in 2 ..< n {
  if graph[0][i] == 0 {
    dp[0][i][0] = dp[0][i-1][0]
  }

//  if graph[i][0] == 0 {
//    dp[i][0][1] = dp[i-1][0][1]
//  }
}

for i in 1 ..< n {
  for j in 2 ..< n {
    if graph[i][j] == 1 { continue }
    
    dp[i][j][0] = dp[i][j-1][0] + dp[i][j-1][2]
    dp[i][j][1] = dp[i-1][j][1] + dp[i-1][j][2]
    
    if graph[i-1][j] == 1 || graph[i][j-1] == 1 { continue }
    
    dp[i][j][2] = dp[i-1][j-1][0] + dp[i-1][j-1][1] + dp[i-1][j-1][2]
  }
}

print(dp[n-1][n-1][0] + dp[n-1][n-1][1] + dp[n-1][n-1][2])
