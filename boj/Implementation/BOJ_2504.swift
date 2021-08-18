/*
 백준 2504 괄호의 값
 21.08.18
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!
let bracket = ["(", ")", "[", "]"]
var stack = [String]()

func addNums(_ n: Int) {
  var num = n

  while !stack.isEmpty && !bracket.contains(stack.last!) {
    num += Int(stack.removeLast())!
  }

  stack.append(String(num))
}

func multiNums(_ n: Int, _ pair: String) -> Bool {
  var num = n

  while !stack.isEmpty && !bracket.contains(stack.last!) {
    num *= Int(stack.removeLast())!
  }

  if stack.isEmpty || stack.last! != pair {
    return false
  } else {
    stack.removeLast()
  }

  if !stack.isEmpty && !bracket.contains(stack.last!) {
    num += Int(stack.removeLast())!
  }

  stack.append(String(num))
  return true
}

for now in input {
  if now == "(" || now == "[" {
    stack.append(String(now))
  } else {
    if stack.isEmpty {
      break
    }

    if now == ")" {
      if stack.last! == "(" {
        stack.removeLast()
        addNums(2)
      } else if stack.last! != "[" {
        if !multiNums(2, "(") {
          break
        }
      } else {
        break
      }

    } else if now == "]" {
      if stack.last! == "[" {
        stack.removeLast()
        addNums(3)
      } else if stack.last! != "(" {
        if !multiNums(3, "[") {
          break
        }
      } else {
        break
      }
    }
  }
}

if stack.isEmpty || stack.count > 1 || bracket.contains(stack[0]) {
  print(0)
} else {
  print(stack[0])
}
