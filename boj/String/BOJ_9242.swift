/*
 21.10.01
 백준 9242 폭탄 해체
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let nums = ["**** ** ** ****": 0, "  *  *  *  *  *": 1,
            "***  *****  ***": 2, "***  ****  ****": 3,
            "* ** ****  *  *": 4, "****  ***  ****": 5,
            "****  **** ****": 6, "***  *  *  *  *": 7,
            "**** ***** ****": 8, "**** ****  ****": 9]

var code = [[String]](repeating: [String](), count: 5)

for i in 0 ..< 5 {
  code[i] = readLine()!.map { String($0) }
}


var num = 0, idx = 0, boom = false

while idx < code[0].count {
  
  if idx + 1 >= code[0].count || idx + 2 >= code[0].count {
    boom = true
    break
  }
  
  var temp = ""
  
  for i in 0 ..< 5 {
    temp += code[i][idx] + code[i][idx + 1] + code[i][idx + 2]
  }
  
  if let digit = nums[temp] {
    num *= 10
    num += digit
  } else {
    boom = true
    break
  }
  
  idx += 4
}

if !boom && num % 6 == 0 {
  print("BEER!!")
} else {
  print("BOOM!!")
}

