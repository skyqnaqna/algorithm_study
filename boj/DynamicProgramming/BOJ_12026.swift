/*
 21.10.15
 백준 12026 BOJ 거리
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)
let n = Int(readLine()!)!

let str = readLine()!.map { String($0) }

var boj = [Int](repeating: 0, count: n)
var dp = [Int](repeating: INF, count: n)
dp[0] = 0

for i in str.indices {
  if str[i] == "O" {
    boj[i] = 1
  } else if str[i] == "J" {
    boj[i] = 2
  }
}

for i in 0 ..< n - 1 {
  let next = (boj[i] + 1) % 3
  
  for j in i + 1 ..< n {
    if boj[j] == next {
      dp[j] = min((j - i) * (j - i) + dp[i], dp[j])
    }
  }
}

if dp[n-1] < INF {
  print(dp[n-1])
} else {
  print(-1)
}
