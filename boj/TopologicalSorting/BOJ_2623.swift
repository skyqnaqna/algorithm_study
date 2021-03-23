// 백준 2623 음악프로그램
// 21.03.23

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var indegree = [Int](repeating: 0, count: n + 1)
var ans = [Int]()
var graph = [[Int]](repeating: [Int](), count: n + 1)

for _ in 0..<m {
  let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for i in stride(from: 2, through: arr[0], by: 1) {
    graph[arr[i-1]].append(arr[i])
    indegree[arr[i]] += 1
  }
}

var q = [Int]()

for i in stride(from: 1, through: n, by: 1) {
  if indegree[i] == 0 {
    q.append(i)
    ans.append(i)
  }
}

var cnt = 0
while !q.isEmpty {
  let now = q.removeLast()
  cnt += 1
  
  for i in graph[now] {
    indegree[i] -= 1
    if indegree[i] == 0 {
      ans.append(i)
      q.append(i)
    }
  }
}

if cnt < n { print(0) }
else { for i in ans { print(i) }}
