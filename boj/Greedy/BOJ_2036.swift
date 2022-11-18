/*
 백준 2036 수열의 점수
 22.11.18
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let n = Int(readLine()!)!

var negative = [Int64]()
var positive = [Int64]()
var answer: Int64 = 0

for _ in 0 ..< n {
  let i = Int64(readLine()!)!

  if i > 0 {
    positive.append(i)
  } else {
    negative.append(i)
  }
}

positive.sort(by: <)
negative.sort(by: >)

while positive.count > 1 {
  let a = positive.removeLast()
  let b = positive.removeLast()

  if b == 1 {
    answer += a
    answer += b
  } else {
    answer += a * b
  }
}

while !positive.isEmpty {
  answer += positive.removeLast()
}

while negative.count > 1 {
  let a = negative.removeLast()
  let b = negative.removeLast()

  answer += a * b
}

while !negative.isEmpty {
  answer += negative.removeLast()
}

print(answer)
