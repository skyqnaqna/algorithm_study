/*
 백준 2407 조합
 21.06.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0], m = input[1]
let overFlow: UInt64 = 1000000000000000000

var left = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)
var right = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)

right[1][0] = 1
right[1][1] = 1

for i in 2...n {
  right[i][0] = 1
  right[i][i] = 1

  for j in 1..<i {
    right[i][j] = right[i - 1][j - 1] + right[i - 1][j]
    left[i][j] = left[i - 1][j - 1] + left[i - 1][j]

    if right[i][j] >= overFlow {
      right[i][j] -= overFlow
      left[i][j] += 1
    }
  }
}

if left[n][m] > 0 {
  print("\(left[n][m])"+String(format: "%018llu", right[n][m]))} else {
  print(right[n][m])
}