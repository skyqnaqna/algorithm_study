/*
 21.11.03
 백준 3067 Coins
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let t = Int(readLine()!)!
var answer = ""

func solution() {
  _ = Int(readLine()!)!
  let coins = readLine()!.split(separator: " ").map { Int(String($0))! }
  let m = Int(readLine()!)!
  var dp = [Int](repeating: 0, count: m + 1)
  
  dp[0] = 1
  
  for coin in coins {
    for i in stride(from: coin, through: m, by: 1) {
      dp[i] += dp[i - coin]
    }
  }
  
  answer += "\(dp[m])\n"
}

for _ in 0 ..< t {
  solution()
}

print(answer)


