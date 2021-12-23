/*
 백준 9342 염색체
 21.12.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var answer = ""
let pattern = #"^[A-F]?A+F+C+[A-F]?$"#

for _ in 0 ..< n {
  let str = readLine()!
  
  if str.range(of: pattern, options: .regularExpression) != nil {
    answer += "Infected!\n"
  } else {
    answer += "Good\n"
  }
}

print(answer)
