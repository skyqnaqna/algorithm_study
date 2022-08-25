/*
 백준 1720 타일 코드
 22.08.25
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var total = [Int](repeating: 0, count: 31)
var symmetry = [Int](repeating: 0, count: 31) // 해당 모양 자체가 대칭구조인 것

total[1] = 1
total[2] = 3

for i in 3 ... 30 {
  total[i] = total[i - 1] + total[i - 2] * 2
}

symmetry[1] = 1
symmetry[2] = 3
symmetry[3] = 1
symmetry[4] = 5

if n < 5 {
  print((total[n] - symmetry[n]) / 2 + symmetry[n])
} else {
  for i in 5 ... 30 {
    symmetry[i] = symmetry[i - 2] + symmetry[i - 4] * 2
  }

  print((total[n] - symmetry[n]) / 2 + symmetry[n])
}
