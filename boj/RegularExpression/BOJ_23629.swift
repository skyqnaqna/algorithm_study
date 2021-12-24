/*
 백준 23629 이 얼마나 끔찍하고 무시무시한 수식이니
 21.12.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let digit = ["ZERO", "ONE", "TWO", "THREE", "FOUR",
             "FIVE", "SIX", "SEVEN", "EIGHT", "NINE"]

var str = readLine()!

for i in digit.indices {
  str = str.replacingOccurrences(of: digit[i],
                                 with: String(i),
                                 options: .regularExpression)
}

func calculate(_ exp: String) -> String {
  let opSet: Set<String> = ["+", "-", "/", "x"]
  var nums = [String]()
  var op = [String]()
  
  let expArr = exp.map { String($0) }
  
  var temp = ""
  for i in 0 ..< expArr.count - 1 {
    if opSet.contains(expArr[i]) {
      op.append(expArr[i])
      
      if !temp.isEmpty {
        nums.append(temp)
      }
      temp = ""
    } else {
      temp += expArr[i]
    }
  }
  
  if !temp.isEmpty {
    nums.append(temp)
  }
  
  if nums.count <= op.count {
    return "Madness!"
  }
  
  var answer = Int(nums[0])!
  
  for i in op.indices {
    switch op[i] {
    case "+":
      answer += Int(nums[i + 1])!
    case "-":
      answer -= Int(nums[i + 1])!
    case "x":
      answer *= Int(nums[i + 1])!
    case "/":
      answer /= Int(nums[i + 1])!
    default:
      return "Madness!"
    }
  }
    
  return String(answer)
}

if str.range(of: #"[A-Z]"#, options: .regularExpression) != nil {
  print("Madness!")
} else {
  var result = calculate(str)
  if result == "Madness!" {
    print(result)
  } else {
    print(str)
    
    for i in digit.indices {
      result = result.replacingOccurrences(of: String(i),
                                           with: digit[i],
                                           options: .regularExpression)
    }
    
    print(result)
  }
}

