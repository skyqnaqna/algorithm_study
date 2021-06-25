/*
 백준 14852 타일 채우기 3
 21.06.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

if n == 1 {
  print(2)
} else if n == 2 {
  print(7)
} else {
  var dp = [Int](repeating: 0, count: n + 1)
  var dpSum = [Int](repeating: 0, count: n + 1) // 시간 초과를 막기 위한 배열임 dp[1] ~ dp[i] 까지의 합 저장

  dp[1] = 2
  dpSum[1] = 2
  dp[2] = 7
  dpSum[2] = 9

  for i in 3 ... n {
    // 시간 초과 원인
//    var sum = 0
//    for j in 1 ..< i - 2 {
//      sum += dp[j]
//    }
//    dp[i] = (dp[i - 1] * 2 + dp[i - 2] * 3 + sum * 2 + 2) % 1000000007

    dp[i] = (dp[i - 1] * 2 + dp[i - 2] * 3 + dpSum[i - 3] * 2 + 2) % 1000000007
    dpSum[i] = (dp[i] + dpSum[i - 1]) % 1000000007
  }

  print(dp[n])
}

