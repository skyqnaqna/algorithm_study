/*
 백준 1013 Contact
 21.12.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation


let n = Int(readLine()!)!
let pattern = #"^(100+1+|01)+$"#
var answer = ""

for _ in 0 ..< n {
  let str = readLine()!
  
  if str.range(of: pattern, options: .regularExpression) != nil {
    answer += "YES\n"
  } else {
    answer += "NO\n"
  }
}

print(answer)
