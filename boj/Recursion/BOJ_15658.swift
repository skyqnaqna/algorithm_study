/*
 백준 15658 연산자 끼워넣기 (2)
 22.06.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

// +, -, * /
var operators = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxVal = Int.min, minVal = Int.max

func recursive(_ idx: Int, _ value: Int) {
  if idx == n {
    maxVal = max(maxVal, value)
    minVal = min(minVal, value)
    
    return
  }
  
  for i in 0 ..< 4 {
    if operators[i] == 0 { continue }
    
    operators[i] -= 1
    switch i {
    case 0:
      recursive(idx + 1, value + arr[idx])
    case 1:
      recursive(idx + 1, value - arr[idx])
    case 2:
      recursive(idx + 1, value * arr[idx])
    default:
      recursive(idx + 1, value / arr[idx])
    }
    operators[i] += 1
  }
}

recursive(1, arr[0])

print(maxVal, minVal, separator: "\n")
