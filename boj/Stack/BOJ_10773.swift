/*
 21.10.28
 백준 10773 제로
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let k = Int(readLine()!)!

var stack = [Int]()

for _ in 0 ..< k {
  let n = Int(readLine()!)!
  
  if n == 0 {
    stack.removeLast()
  } else {
    stack.append(n)
  }
}

print(stack.reduce(0, +))
