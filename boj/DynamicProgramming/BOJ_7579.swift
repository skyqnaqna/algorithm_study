/*
 백준 7579 앱
 22.10.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]

var apps = [[Int]]()
var memory = [0]
var cost = [0]

memory += readLine()!.split(separator: " ").map { Int(String($0))! }
cost += readLine()!.split(separator: " ").map { Int(String($0))! }

let totalCost = cost.reduce(0, +)

var dp = [[Int]](repeating: [Int](repeating: 0, count: totalCost + 1), count: n + 1)
var answer = Int(1e9)

for i in 1 ... n {
  for j in 0 ... totalCost {
    if cost[i] <= j {
      dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - cost[i]] + memory[i])
    } else {
      dp[i][j] = dp[i - 1][j]
    }

    if m <= dp[i][j] {
      answer = min(answer, j)
    }
  }
}

print(answer)
