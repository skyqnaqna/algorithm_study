/*
 백준 15988 1, 2, 3 더하기 3
 22.01.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let MOD = 1000000009
let t = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 1000001)

dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4 ... 1000000 {
  dp[i] = (dp[i - 3] + dp[i - 2] + dp[i - 1]) % MOD
}

var answer = ""
for _ in 0 ..< t {
  let n = Int(readLine()!)!
  
  answer += "\(dp[n])\n"
}

print(answer)
