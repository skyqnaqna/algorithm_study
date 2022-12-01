/*
 백준 2240 자두나무
 22.12.01
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let t = input[0], w = input[1]

var tree = [Int]()

for _ in 0 ..< t {
  tree.append(Int(readLine()!)!)
}

var dp = [[Int]](repeating: [Int](repeating: -1, count: w + 1), count: t)

func solution(_ time: Int, _ move: Int) -> Int {
  if time >= t || move > w { return 0 }

  if dp[time][move] != -1 { return dp[time][move] }

  let pos = move % 2 + 1
  dp[time][move] = tree[time] == pos ? 1 : 0
  dp[time][move] += max(solution(time + 1, move), solution(time + 1, move + 1))

  return dp[time][move]
}

print(max(solution(0, 0), solution(0, 1)))
