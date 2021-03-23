// 백준 2056 작업
// 21.03.23

import Foundation

let n = Int(readLine()!)!

var graph = Array(repeating: Array<Int>(), count: n + 1)
var indegree = Array(repeating: 0, count: n + 1)
var time = Array(repeating: 0, count: n + 1)
var ans = Array(repeating: 0, count: n + 1)

for i in stride(from: 1, through: n, by: 1) {
  let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
  time[i] = arr[0]
  
  for j in stride(from: 2, to: 2 + arr[1], by: 1) {
    graph[arr[j]].append(i)
    indegree[i] += 1
  }
}

var q: [Int] = []
for i in stride(from: 1, through: n, by: 1) {
  if indegree[i] == 0 {
    q.append(i)
    ans[i] = time[i]
  }
}

while !q.isEmpty {
  let now = q.removeLast()
  
  for i in graph[now] {
    indegree[i] -= 1
    ans[i] = max(ans[i], ans[now] + time[i])
    if indegree[i] == 0 { q.append(i) }
  }
}

print(ans.max()!)
