/*
 백준 15486 퇴사 2
 23.02.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var arr = [[Int]]()
var dp = [Int](repeating: 0, count: n + 1)
var answer = 0

for _ in 0 ..< n {
  arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for i in stride(from: n - 1, through: 0, by: -1) {
  let day = i + arr[i][0]

  if day <= n {
    dp[i] = max(answer, dp[day] + arr[i][1])
  } else {
    dp[i] = answer
  }
  answer = max(answer, dp[i])
}

print(answer)
