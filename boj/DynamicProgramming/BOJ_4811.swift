/*
 21.09.27
 백준 4811 알약
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var dp = [[Int64]](repeating: [Int64](repeating: 0, count: 32), count: 32)

for i in 0 ... 30 {
  dp[0][i] = 1
}

for w in 1 ... 30 {
  for h in 0 ... 30 {
    if h == 0 {
      dp[w][h] = dp[w - 1][1]
    } else {
      dp[w][h] = dp[w - 1][h + 1] &+ dp[w][h - 1]
    }
  }
}

var answer = ""

while true {
  let n = Int(readLine()!)!
  
  if n == 0 { break }
  
  answer += "\(dp[n - 1][1])\n"
}

print(answer)
