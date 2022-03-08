/*
 백준 21937 작업
 22.03.08
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var jobs = [[Int]](repeating: [Int](), count: 100001)
var visited = [Bool](repeating: false, count: 100001)

for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  jobs[i[1]].append(i[0])
}

let x = Int(readLine()!)!
var q = [Int](), front = 0
q.append(x)
visited[x] = true

var answer = 0

while front < q.count {
  let now = q[front]
  front += 1
  
  for next in jobs[now] {
    if visited[next] { continue }
    
    visited[next] = true
    answer += 1
    q.append(next)
  }
}

print(answer)
