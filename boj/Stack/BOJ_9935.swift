/*
 백준 9935 문자열 폭발
 21.12.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let str = readLine()!.map { String($0) }
let bomb = readLine()!.map { String($0) }

var stack = [String]()

for s in str {
  stack.append(s)
  
  if stack.count >= bomb.count && stack.last! == bomb.last! {
    var isBomb = true
    
    for i in 0 ..< bomb.count {
      if bomb[i] != stack[stack.count - bomb.count + i] {
        isBomb = false
        break
      }
    }
    
    if isBomb {
      for _ in 0 ..< bomb.count {
        stack.removeLast()
      }
    }
  }
}

if stack.isEmpty {
  print("FRULA")
} else {
  print(stack.map { $0 }.joined())
}
