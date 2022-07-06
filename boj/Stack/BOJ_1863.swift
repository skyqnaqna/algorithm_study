/*
 백준 1863 스카이라인 쉬운거
 22.07.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var answer = 0
var arr = [(Int, Int)]()
var stack = [Int]()

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let y = input[1]
  
  while !stack.isEmpty && y < stack.last! {
    answer += 1
    stack.removeLast()
  }
  
  if y == 0 { continue }
  
  if stack.isEmpty || stack.last! != y {
    stack.append(y)
  }
}

print(answer + stack.count)
