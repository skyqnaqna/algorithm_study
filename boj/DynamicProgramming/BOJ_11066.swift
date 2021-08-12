/*
 백준 11066 파일 합치기
 21.08.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!

while t > 0 {
  t -= 1

  let n = Int(readLine()!)!
  let files = readLine()!.split(separator: " ").map { Int(String($0))! }
  var sum = [Int](repeating: 0, count: n + 1)

  for i in 1 ... n {
    sum[i] = sum[i-1] + files[i-1]
  }

  var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)

  for k in 1 ..< n {
    for i in 1 ... n - k {
      let j = i + k
      dp[i][j] = Int.max
      for m in i ..< j {
        dp[i][j] = min(dp[i][j], dp[i][m] + dp[m+1][j] + sum[j] - sum[i-1])
      }
    }
  }

  print(dp[1][n])
}
