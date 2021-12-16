/*
 백준 1484 다이어트
 21.12.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let g = Int(readLine()!)!
var answer = ""

var l = 1, r = 2

while r * r - (r - 1) * (r - 1) <= g {
  let diff = r * r - l * l
  
  if diff == g {
    answer += "\(r)\n"
    r += 1
    l += 1
  } else if diff < g {
    r += 1
  } else {
    l += 1
  }
}

if answer.isEmpty {
  print(-1)
} else {
  print(answer)
}
