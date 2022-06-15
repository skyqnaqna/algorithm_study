/*
 백준 13335 트럭
 22.06.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], w = input[1], l = input[2]

let trucks = readLine()!.split(separator: " ").map { Int(String($0))! }

var q = [(Int, Int)](), front = 0, i = 0, weight = 0, time = 0
var cnt: Int { return q.count - front }
var empty: Bool { return q.count == front }

while !empty || i < n {
  if !empty && q[front].0 == time {
    weight -= q[front].1
    front += 1
  }
  
  if cnt < w && i < n && weight + trucks[i] <= l {
    q.append((time + w, trucks[i]))
    weight += trucks[i]
    i += 1
  }
  
  time += 1
}

print(time)
