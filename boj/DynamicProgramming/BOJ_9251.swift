/*
 백준 9251 LCS
 21.08.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let a = Array(readLine()!)
let b = Array(readLine()!)

var dp = [[Int]](repeating: [Int](repeating: 0, count: a.count + 1), count: b.count + 1)

for i in 1 ... b.count {
  for j in 1 ... a.count {
    if b[i-1] == a[j-1] {
      dp[i][j] = dp[i-1][j-1] + 1
    } else {
      dp[i][j] = max(dp[i-1][j], dp[i][j-1])
    }
  }
}

print(dp.last!.last!)