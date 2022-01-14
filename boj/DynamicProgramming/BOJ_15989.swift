/*
 백준 15989 1, 2, 3 더하기 4
 22.01.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var dp = [Int](repeating: 0, count: 10001)
dp[0] = 1

for i in 1 ... 3 {
  for j in i ... 10000 {
    dp[j] += dp[j - i]
  }
}

let t = Int(readLine()!)!

for _ in 0 ..< t {
  let n = Int(readLine()!)!
  
  print(dp[n])
}
