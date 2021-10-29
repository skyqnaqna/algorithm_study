/*
 21.10.30
 백준 12865 평범한 배낭
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], k = input[1]

var w = [Int](repeating: 0, count: n), v = [Int](repeating: 0, count: n), dp = [Int](repeating: 0, count: k + 1)

for i in 0 ..< n {
  let info = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  w[i] = info[0]
  v[i] = info[1]
}

for i in 0 ..< n {
  for j in stride(from: k, through: w[i], by: -1) {
    dp[j] = max(dp[j], dp[j - w[i]] + v[i])
  }
}

print(dp[k])
