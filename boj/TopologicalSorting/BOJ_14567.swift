// 백준 14567 선수과목
// 21.03.22

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var indegree = Array(repeating: 0, count: n + 1)
var graph = Array(repeating: Array<Int>(), count: n + 1)
var ans = Array(repeating: 1, count: n + 1)

for _ in 0..<m {
  let uv = readLine()!.split(separator: " ").map {Int(String($0))! }
  graph[uv[0]].append(uv[1])
  indegree[uv[1]] += 1
}

var q: [Int] = []
for i in stride(from: 1, through: n, by: 1) {
  if indegree[i] == 0 { q.append(i) }
}

while !q.isEmpty {
  let now = q.removeLast()
  
  for i in graph[now] {
    indegree[i] -= 1
    ans[i] = max(ans[i], ans[now] + 1)
    if indegree[i] == 0 { q.append(i) }
  }
}

for i in 1...n { print(ans[i], terminator: " ")}
