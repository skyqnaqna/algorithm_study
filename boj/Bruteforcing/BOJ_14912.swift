/*
 21.10.10
 백준 14912 숫자 빈도수
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], d = input[1]

var answer = 0

for i in 1 ... n {
  var num = i
  
  while num > 0 {
    if num % 10 == d {
      answer += 1
    }
    
    num /= 10
  }
}

print(answer)
