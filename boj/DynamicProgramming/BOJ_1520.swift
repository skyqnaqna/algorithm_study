/*
 백준 1520 내리막 길
 22.01.09
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)

// dfs탐색 시 첫 방문 좌표는 경로수가 0으로 시작하여 합산하므로
// 첫 방문인지 경로수가 0개인지 구분할 수 없기 때문에 경로수가 될 수 없는 값으로 초기화한다
var dp = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

func dfs(_ r: Int, _ c: Int) -> Int {
  if r == n - 1 && c == m - 1 { return 1 }
  if dp[r][c] != -1 { return dp[r][c] }
  
  dp[r][c] = 0
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx

    if !inBound(nr, nc) { continue }

    if graph[nr][nc] < graph[r][c] {
      dp[r][c] += dfs(nr, nc)
    }
  }
  
  return dp[r][c]
}

print(dfs(0, 0))
