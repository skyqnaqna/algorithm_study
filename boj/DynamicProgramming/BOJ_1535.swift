/*
 백준 1535 안녕
 22.07.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let l = readLine()!.split(separator: " ").map { Int(String($0))! }
let j = readLine()!.split(separator: " ").map { Int(String($0))! }

// MARK: - 풀이 2) DP (0-1 Knapsack)

var dp = [[Int]](repeating: [Int](repeating: 0, count: 101), count: n + 1)

for i in 1 ... n {
  for hp in 1 ..< 100 {
    if hp < l[i - 1] {
      dp[i][hp] = dp[i - 1][hp]
      continue
    }
    
    dp[i][hp] = max(dp[i - 1][hp], dp[i - 1][hp - l[i - 1]] + j[i - 1])
  }
}

print(dp[n].max()!)

// MARK: - 풀이 1) 브루트포스

//var answer = 0
//
//func solution(_ idx: Int, _ hp: Int, _ joy: Int) {
//  if idx == n {
//    answer = max(answer, joy)
//    return
//  }
//
//  if l[idx] < hp {
//    solution(idx + 1, hp - l[idx], joy + j[idx])
//  }
//
//  solution(idx + 1, hp, joy)
//}
//
//solution(0, 100, 0)
//
//print(answer)
