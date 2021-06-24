/*
 백준 2133 타일 채우기
 21.06.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 31)

dp[2] = 3/*
 백준 2133 타일 채우기
 21.06.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 31)

dp[2] = 3

for i in 2 ... 15 {
  var sum = 0
  for j in 1 ..< i - 1 {
    sum += dp[j * 2]
  }

  dp[i * 2] = dp[(i - 1) * 2] * 3 + 2 * sum + 2
}

print(dp[n])


for i in 2 ... 15 {
  var sum = 0
  for j in 1 ..< i - 1 {
    sum += dp[j * 2]
  }

  dp[i * 2] = dp[(i - 1) * 2] * 3 + 2 * sum + 2
}

print(dp[n])
