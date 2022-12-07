/*
 백준 2961 도영이가 만든 맛있는 음식
 22.12.07
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let n = Int(readLine()!)!

var arr = [[Int]]()
var answer = 1111111111

for _ in 0 ..< n {
  arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

for state in 1 ..< (1 << n) {
  var a = 1, b = 0

  for i in 0 ..< n {
    if (state & (1 << i)) != 0 {
      a *= arr[i][0]
      b += arr[i][1]
    }
  }

  if abs(a - b) < answer {
    answer = abs(a - b)
  }
}

print(answer)
