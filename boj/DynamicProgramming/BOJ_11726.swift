/*
 백준 11726 2xn 타일링
 21.06.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1001)
dp[1] = 1
dp[2] = 2

for i in 3...1000 {
  dp[i] = (dp[i - 1] + dp[i - 2]) % 10007
}

print(dp[n])