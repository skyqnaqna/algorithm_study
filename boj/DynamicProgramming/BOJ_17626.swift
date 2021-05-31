// 백준 17626 Four Squares
// 21.05.31

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 50001)

dp[1] = 1

for i in 2...n {
  var minValue = Int(1e9)

  for j in 1..<Int(sqrt(Double(i))) + 1 {
    minValue = min(minValue, dp[i - j * j])
  }

  dp[i] = 1 + minValue
}

print(dp[n])