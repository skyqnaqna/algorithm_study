/*
 백준 17404 RGB거리 2
 21.12.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)
let n = Int(readLine()!)!

var rgb = [[Int]](repeating: [Int](), count: n)
var dp = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

for i in 0 ..< n {
  rgb[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var answer = INF

for i in 0 ..< 3 {
  dp[0][i] = rgb[0][i]
  dp[0][(i + 1) % 3] = INF
  dp[0][(i + 2) % 3] = INF
  
  for j in 1 ..< n {
    dp[j][0] = rgb[j][0] + min(dp[j - 1][1], dp[j - 1][2])
    dp[j][1] = rgb[j][1] + min(dp[j - 1][0], dp[j - 1][2])
    dp[j][2] = rgb[j][2] + min(dp[j - 1][0], dp[j - 1][1])
  }
  
  answer = min(answer, min(dp[n - 1][(i + 1) % 3], dp[n - 1][(i + 2) % 3]))
}

print(answer)
