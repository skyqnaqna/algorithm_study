/*
 21.10.07
 백준 5014 스타트링크
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let F = input[0], S = input[1], G = input[2], U = input[3], D = input[4]

var floor = [Int](repeating: -1, count: F + 1)

var q = [Int](), front = 0

q.append(S)
floor[S] = 0

while front < q.count {
  let now = q[front]
  front += 1
  let dist = floor[now]
  
  if now == G {
    break
  }
  
  if now + U <= F && floor[now + U] == -1 {
    floor[now + U] = dist + 1
    q.append(now + U)
  }
  
  if now - D >= 1 && floor[now - D] == -1 {
    floor[now - D] = dist + 1
    q.append(now - D)
  }
}

if floor[G] != -1 {
  print(floor[G])
} else {
  print("use the stairs")
}
