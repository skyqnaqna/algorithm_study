/*
 21.10.04
 백준 2839 설탕 배달
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 5000, count: 5001)
dp[3] = 1
dp[5] = 1
if n >= 6 {
  for i in 6 ... n {
    if i - 5 < 0 { continue }
      dp[i] = min(dp[i - 3], dp[i - 5]) + 1
  }
}

if dp[n] < 5000 {
  print(dp[n])
} else {
  print(-1)
}
