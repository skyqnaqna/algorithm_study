/*
 백준 1052 물병
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = input[0]
let k = input[1]

func check(_ a: Int) -> Int {
  var cnt = 0, num = a
  
  while num != 0 {
    num &= (num - 1)
    cnt += 1
  }
 
  return cnt
}

var answer = 0

while check(n) > k {
  n += 1
  answer += 1
}

print(answer)
