// 백준 14501 퇴사
// 21.05.26

import Foundation

let n = Int(readLine()!)!
var schedule = [[Int]](repeating: [Int](), count: n)
var dp = [Int](repeating: 0, count: n + 1)

for i in 0..<n {
  schedule[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var maxProfit = 0

for i in stride(from: n - 1, through: 0, by: -1) {
  let days = schedule[i][0] + i

  if days <= n {
    dp[i] = max(maxProfit, dp[days] + schedule[i][1])
    maxProfit = dp[i]
  } else {
    dp[i] = maxProfit
  }
}

print(maxProfit)