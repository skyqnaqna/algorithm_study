/*
 백준 10971 외판원 순회 2
 21.06.30
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](), count: n)
var visited = [Bool](repeating: false, count: n)
var answer = Int.max

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

func backtracking(_ count: Int, _ start: Int, _ now: Int, _ cost: Int) {
  if cost > answer { return }
  else if count == n {
    if graph[now][start] == 0 { return }
    answer = min(answer, cost + graph[now][start])
  } else {
    for next in 0 ..< n {
      if !visited[next] && graph[now][next] > 0 {
        visited[next] = true
        backtracking(count + 1, start, next, cost + graph[now][next])
        visited[next] = false
      }
    }
  }
}

for i in 0 ..< n {
  visited[i] = true
  backtracking(1, i, i, 0)
  visited[i] = false
}

print(answer)
