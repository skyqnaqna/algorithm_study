/*
 백준 2493 탑
 22.04.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let tower = readLine()!.split(separator: " ").map { Int(String($0))! }

var stack = [(Int, Int)]()
var answer = [Int](repeating: 0, count: n)

for (i, now) in tower.enumerated() {
  while !stack.isEmpty && stack.last!.1 < now {
    stack.removeLast()
  }
  
  if !stack.isEmpty {
    answer[i] = stack.last!.0 + 1
  }
  
  stack.append((i, now))
}

let res = answer.map { String($0) }.joined(separator: " ")

print(res)
