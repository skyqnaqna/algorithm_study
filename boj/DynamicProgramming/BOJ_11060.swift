/*
 21.10.01
 백준 11060 점프 점프
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let graph = readLine()!.split(separator: " ").map { Int(String($0))! }


var dp = [Int](repeating: 1000, count: n)

dp[0] = 0

for i in 0 ..< n {
  if dp[i] == 1000 { continue }
  let range = graph[i]

  for j in stride(from: i + range, to: 0, by: -1) {
    if j < n && dp[i] + 1 < dp[j] {
      dp[j] = dp[i] + 1
    }
  }
}

if dp[n - 1] == 1000 {
  print(-1)
} else {
  print(dp[n - 1])
}

//var dist = [Int](repeating: 1000, count: n)
//
//var q = [(Int, Int)](), front = 0
//q.append((0, 0)) // now, dist
//dist[0] = 0
//
//while front < q.count {
//  let (now, cnt) = q[front]
//  front += 1
//
//  if now == n - 1 { break }
//
//  if graph[now] == 0 { continue }
//
//  for i in 1 ... graph[now] {
//    if now + i < n && cnt + 1 < dist[now + i]{
//      q.append((now + i, cnt + 1))
//      dist[now + i] = cnt + 1
//    }
//  }
//}
//
//if dist[n - 1] != 1000 {
//  print(dist[n - 1])
//} else {
//  print(-1)
//}
