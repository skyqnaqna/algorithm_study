/*
 백준 14248 점프 점프
 22.06.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let jump = readLine()!.split(separator: " ").map { Int(String($0))! }
var isVisited = [Bool](repeating: false, count: n)

let start = Int(readLine()!)! - 1

var answer = 1
var q = [Int](), front = 0

q.append(start)
isVisited[start] = true

while front < q.count {
  let now = q[front]
  front += 1
  
  let left = now - jump[now]
  let right = now + jump[now]
  
  if 0 <= left && !isVisited[left] {
    q.append(left)
    isVisited[left] = true
    answer += 1
  }
      
  if right < n && !isVisited[right] {
    q.append(right)
    isVisited[right] = true
    answer += 1
  }
}

print(answer)
