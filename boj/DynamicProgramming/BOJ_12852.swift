/*
 백준 12852 1로 만들기 2
 21.08.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let INF = Int(2e9)
var dp = [Int](repeating: INF, count: n + 1)
var history = [String](repeating: "", count: n + 1)

dp[0] = -1
dp[n] = 0
var q = [Int](), front = 0
q.append(n)

while front < q.count {
  let now = q[front]
  front += 1

  if now == 1 { break }

  let cnt = dp[now] + 1

  if now % 3 == 0 && cnt < dp[now / 3] {
    dp[now / 3] = cnt
    history[now / 3] = history[now] + " \(now / 3)"
    q.append(now / 3)
  }
  if now % 2 == 0 && cnt < dp[now / 2] {
    dp[now / 2] = cnt
    history[now / 2] = history[now] + " \(now / 2)"
    q.append((now / 2))
  }
  if now - 1 > 0 && cnt < dp[now - 1] {
    dp[now - 1] = cnt
    history[now - 1] = history[now] + " \(now - 1)"
    q.append((now - 1))
  }
}

print(dp[1])
print(n, history[1], separator: "")
