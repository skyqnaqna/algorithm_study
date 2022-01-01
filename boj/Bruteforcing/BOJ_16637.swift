/*
 백준 16637 괄호 추가하기
 22.01.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.map { String($0) }

var answer = -Int(3e9)

func calculate(_ a: Int, _ b: Int, _ op: String) -> Int {
  switch op {
  case "+":
    return a + b
  case "-":
    return a - b
  case "*":
    return a * b
  default:
    return 0
  }
}

func solution(_ idx: Int, _ nums: [Int], _ op: [String], _ cal: Bool) {
  if idx == n {
    var val = nums[0]
    
    for i in 0 ..< op.count {
      val = calculate(val, nums[i + 1], op[i])
    }
    
    if answer < val {
      answer = val
    }
    
    return
  }
  
  if idx % 2 != 0 {
    solution(idx + 1, nums, op + [input[idx]], cal)
  } else {
    if !op.isEmpty && !cal {
      var newNums = nums
      var newOp = op
      
      let val = calculate(newNums.removeLast(), Int(input[idx])!, newOp.removeLast())
      newNums.append(val)
      solution(idx + 1, newNums, newOp, true)
    }
    solution(idx + 1, nums + [Int(input[idx])!], op, false)
  }
}

solution(0, [], [], false)

print(answer)
