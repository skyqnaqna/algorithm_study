// 백준 3098 소셜네트워크
// 21.03.19

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
let INF = Int(1e9)

var days = Array(repeating: 0, count: n + 1)
var graph = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)

for _ in 0..<m {
  let line = readLine()!.split(separator: " ").map { Int(String($0))! }
  graph[line[0]][line[1]] = 0
  graph[line[1]][line[0]] = 0
}

var cnt = m
var day = 1

while cnt < n*(n-1)/2 {
  for o in stride(from: 1, through: n, by: 1) {
    for i in stride(from: 1, through: n, by: 1) {
      for j in stride(from: 1, through: n, by: 1) {
        if i == j || i == o || j == o { continue }
        if graph[i][j] == INF && graph[i][o] < day && graph[o][j] < day {
          graph[i][j] = day
          graph[j][i] = day
          days[day] += 1
          cnt += 1
        }
      }
    }
  }
  day += 1
}

print(day - 1)
for i in stride(from: 1, to: day, by: 1) { print(days[i]) }
