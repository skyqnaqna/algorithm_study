/*
 백준 9465 스티커
 21.06.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!

while t > 0 {
  t -= 1

  let n = Int(readLine()!)!

  var sticker = [[Int]](repeating: [Int](), count: 2)
  var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)

  sticker[0] = readLine()!.split(separator: " ").map {
    Int(String($0))!
  }
  sticker[1] = readLine()!.split(separator: " ").map {
    Int(String($0))!
  }

  dp[0][0] = sticker[0][0]
  dp[1][0] = sticker[1][0]

  dp[0][1] = dp[1][0] + sticker[0][1]
  dp[1][1] = dp[0][0] + sticker[1][1]

  for i in 2..<n {
    dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + sticker[0][i]
    dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + sticker[1][i]
  }

  print(max(dp[0][n - 1], dp[1][n - 1]))
}
