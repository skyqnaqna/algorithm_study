/*
 백준 1082 방 번호
 22.04.19
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!

var dp = [String](repeating: "", count: 51)

for i in 1 ... m {
  for j in stride(from: n - 1, to: 0, by: -1) {
    if i < p[j] { continue }
    if dp[i].count < dp[i - p[j]].count + 1 {
      dp[i] = "\(j)" + dp[i - p[j]]
    }
  }
  
  if dp[i].isEmpty && i >= p[0] {
    dp[i] = "0"
  } else if i >= p[0] && dp[i].count < dp[i - p[0]].count + 1 && dp[i - p[0]] != "0" {
    dp[i] = dp[i - p[0]] + "0"
  } else if i >= p[0] && dp[i].count == dp[i - p[0]].count + 1 && dp[i - p[0]] != "0" {
    dp[i] = max(dp[i], dp[i - p[0]] + "0")
  }
}

print(dp[m])
