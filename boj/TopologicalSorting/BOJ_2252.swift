// 백준 2252 줄 세우기
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
  graph[arr[0]].append(arr[1])
  indegree[arr[1]] += 1
}

var q = [Int]()

for i in 1...n {
  if indegree[i] == 0 {
    q.append(i)
    ans.append(i)
  }
}

while !q.isEmpty {
  let now = q.removeLast()
  
  for i in graph[now] {
    indegree[i] -= 1
    if indegree[i] == 0 {
      q.append(i)
      ans.append(i)
    }
  }
}

for i in ans { print(i, terminator: " ") }
