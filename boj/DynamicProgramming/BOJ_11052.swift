/*
 21.10.21
 백준 11052 카드 구매하기
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let price = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int](repeating: 0, count: n + 1)


for i in 1 ... n {
  for j in 1 ... i {
    dp[i] = max(dp[i], dp[i - j] + price[j - 1])
  }
}

print(dp[n])
