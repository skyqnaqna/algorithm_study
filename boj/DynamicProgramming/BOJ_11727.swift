/*
 백준 11727 2xn 타일링 2
 21.06.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

switch n {
case 1:
  print(1)
case 2:
  print(3)
default:
  var dp = [Int](repeating: 0, count: n + 1)
  dp[1] = 1
  dp[2] = 3

  for i in 3...n {
    dp[i] = (dp[i - 1] + dp[i - 2] * 2) % 10007
  }

  print(dp[n])
}