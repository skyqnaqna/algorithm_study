/*
 백준 2302 극장 좌석
 23.01.03
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 41)

dp[0] = 1
dp[1] = 1
dp[2] = 2

for i in 3 ... 40 {
  dp[i] = dp[i - 2] * 2 + dp[i - 1] - dp[i - 2]
}

var pre = 0, answer = 1

if m > 0 {
  for _ in 0 ..< m {
    let i = Int(readLine()!)!

    answer *= dp[i - pre - 1]
    pre = i
  }
}

answer *= dp[n - pre]

print(answer)
