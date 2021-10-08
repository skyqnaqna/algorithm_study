/*
 21.10.08
 백준 2637 장난감 조립
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var m = Int(readLine()!)!
var basic = [Bool](repeating: true, count: n + 1)
basic[0] = false

var edges = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
var indegree = [Int](repeating: 0, count: n + 1)
var result = [Int](repeating: 0, count: n + 1)

while m > 0 {
  m -= 1
  
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  let x = input[0], y = input[1], k = input[2]
  
  edges[x].append((y, k))
  basic[x] = false
  indegree[y] += 1
}

var q = [Int](), front = 0
result[n] = 1
q.append(n)

while front < q.count {
  let now = q[front]
  front += 1
  
  for (next, cnt) in edges[now] {
    result[next] += result[now] * cnt
    indegree[next] -= 1
    
    if indegree[next] == 0 {
      q.append(next)
    }
  }
}


var answer = ""
for i in 1 ..< n {
  if basic[i] {
    answer += "\(i) \(result[i])\n"
  }
}

print(answer)
