/*
 백준 1676 팩토리얼 0의 개수
 22.08.30
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var answer = 0
var x = 5

while x <= n {
  answer += n / x
  x *= 5
}

print(answer)
