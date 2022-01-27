/*
 백준 18513 샘터
 22.01.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let water = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]

var visited = Set<Int>()
var answer = 0, cnt = 0
var q = [(Int, Int)](), front = 0

for x in water {
  q.append((x, 0))
  visited.insert(x)
}

while front < q.count {
  let (now, dist) = q[front]
  front += 1
  
  if !visited.contains(now + 1) {
    q.append((now + 1, dist + 1))
    answer += dist + 1
    cnt += 1
    visited.insert(now + 1)
  }
  
  if cnt == k { break }
  
  if !visited.contains(now - 1) {
    q.append((now - 1, dist + 1))
    answer += dist + 1
    cnt += 1
    visited.insert(now - 1)
  }
  
  if cnt == k { break }
}

print(answer)
