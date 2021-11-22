/*
 백준 1744 수 묶기
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!


var negative = [Int](), positive = [Int]()
var zero = 0, answer = 0

for _ in 0 ..< n {
  let num = Int(readLine()!)!
  
  if num == 1 {
    answer += 1
  } else if num < 0 {
    negative.append(num)
  } else if num > 0 {
    positive.append(num)
  } else {
    zero += 1
  }
}

negative.sort(by: >)
positive.sort()


while positive.count > 1 {
  answer += (positive.removeLast() * positive.removeLast())
}

while negative.count > 1 {
  answer += (negative.removeLast() * negative.removeLast())
}

while zero > 0 && !negative.isEmpty {
  negative.removeLast()
  zero -= 1
}

while !positive.isEmpty {
  answer += positive.removeLast()
}

while !negative.isEmpty {
  answer += negative.removeLast()
}

print(answer)
