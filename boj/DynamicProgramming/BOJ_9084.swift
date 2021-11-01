/*
 21.11.01
 백준 9084 동전
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
    if coin > m { break }
    
    for i in coin ... m {
      dp[i] += dp[i - coin]
    }
  }
  
  answer += "\(dp[m])\n"
}

for _ in 0 ..< t {
  solution()
}

print(answer)

