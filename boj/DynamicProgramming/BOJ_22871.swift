/*
 백준 22871 징검다리 건너기 (large)
 22.11.25
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let INF = Int(6e9)

var dp = [Int](repeating: INF, count: n)

func solution(_ now: Int) -> Int {
  if now == n - 1 {
    dp[now] = 0
    return 0
  }

  if dp[now] != INF {
    return dp[now]
  }

  for i in now + 1 ..< n {
    let cost = (i - now) * (1 + abs(arr[i] - arr[now]))

    dp[now] = min(dp[now], max(cost, solution(i)))
  }

  return dp[now]
}

print(solution(0))
