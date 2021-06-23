/*
 백준 17951 흩날리는 시험지 속에서 내 평점이 느껴진거야
 21.06.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], k = input[1]
let score = readLine()!.split(separator: " ").map{ Int(String($0))! }

var left = 0, right = 20 * n + 1

while left + 1 < right {
  let mid = (left + right) / 2

  var numOfGroup = 0, sumOfGroup = 0
  for i in 0 ..< n {
    sumOfGroup += score[i]

    if sumOfGroup >= mid {
      numOfGroup += 1
      sumOfGroup = 0
    }
  }

  if numOfGroup >= k {
    left = mid
  } else {
    right = mid
  }
}

print(left)

