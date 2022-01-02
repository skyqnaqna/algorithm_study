/*
 프로그래머스 다트 게임
 22.01.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ dartResult:String) -> Int {
  var nums = [Int]()
  var bonus = [String]()
  var score = [Int]()
  
  var num = "", str = ""
  
  for i in dartResult {
    if i == "S" || i == "D" || i == "T" || i == "*" || i == "#" {
      if !num.isEmpty {
        nums.append(Int(num)!)
        num = ""
      }
      str += String(i)
    } else {
      if !str.isEmpty {
        bonus.append(str)
        str = ""
      }
      num += String(i)
    }
  }
  
  bonus.append(str)
  
  for i in 0 ..< nums.count {
    var val = nums[i]
    for s in bonus[i] {
      switch s {
      case "D":
        val = Int(pow(Double(val), 2))
      case "T":
        val = Int(pow(Double(val), 3))
      case "*":
        val *= 2
        
        if !score.isEmpty {
          let pre = score.removeLast()
          score.append(pre * 2)
        }
      case "#":
        val *= -1
      default:
        continue
      }
    }
    score.append(val)
  }
  
  return score.reduce(0, +)
}

print(solution("1S2D*3T"))
