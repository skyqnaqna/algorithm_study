/*
 백준 2504 괄호의 값
 22.04.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let arr = readLine()!.map { String($0) }

var stack = [String]()
var num = 1

for now in arr {
  if now == "(" || now == "[" {
    if num > 1 {
      stack.append(String(num))
      num = 1
    }
    stack.append(now)
  } else if now == ")" {
    if stack.isEmpty || stack.last! == "[" {
      num = 0
      break
    } else {
      while !stack.isEmpty && stack.last! != "(" {
        num += Int(stack.removeLast())!
      }
      
      if !stack.isEmpty && stack.last! == "(" {
        stack.removeLast()
        num *= 2
      } else {
        num = 0
        break
      }
    }
  } else {
    if stack.isEmpty || stack.last! == "(" {
      num = 0
      break
    } else {
      while !stack.isEmpty && stack.last! != "[" {
        num += Int(stack.removeLast())!
      }
    }
    
    if !stack.isEmpty && stack.last! == "[" {
      stack.removeLast()
      num *= 3
    } else {
      num = 0
      break
    }
  }
}

while !stack.isEmpty {
  if stack.last! != "(" && stack.last! != "[" {
    num += Int(stack.removeLast())!
  } else {
    num = 0
    break
  }
}

print(num)
