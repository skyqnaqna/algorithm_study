/*
 21.09.29
 백준 10164 격자상의 경로
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1], k = input[2]

var answer = 0

var dp = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)


// 경유지가 없는 경우와 있는 경우로 나눔
if k == 0 {
  dp[1][1] = 1 // 시작점 1로 설정
  
  for i in 1 ... n {
    for j in 1 ... m {
      dp[i][j] += dp[i - 1][j] + dp[i][j - 1]
    }
  }
  
  answer = dp[n][m]
  
} else {
  // 경유지의 위치 구하기
  let midRow = (k - 1) / m + 1
  let midCol = (k - 1) % m + 1
  
  dp[midRow][midCol] = 1 // 시작점 1로 설정
  
  // 1. 경유지에서 목적지까지 가는 경로 수 구하기
  for i in midRow ... n {
    for j in midCol ... m {
      dp[i][j] += dp[i - 1][j] + dp[i][j - 1]
    }
  }
  
  // 시작점에서 경유지까지 가는 경로 0으로 초기화
  dp[midRow][midCol] = 0
  dp[1][1] = 1
  // 2. 경유지까지 가는 경로 수 구하기
  for i in 1 ... midRow {
    for j in 1 ... midCol {
      dp[i][j] += dp[i - 1][j] + dp[i][j - 1]
    }
  }
  
  answer = dp[midRow][midCol] * dp[n][m]
}

print(answer)
