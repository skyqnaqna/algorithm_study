/*
 백준 21757 나누기
 21.09.18
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var prefixSum = [Int](repeating: 0, count: n + 1)
var area = [Int](repeating: 0, count: 4)

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 1 ... n {
  prefixSum[i] = prefixSum[i - 1] + arr[i - 1]
}

if prefixSum.last! % 4 != 0 {
  print(0)
} else {
  let quater = prefixSum.last! / 4

  area[0] = 1
  for i in 1 ... n - 1 {
    if prefixSum[i] == 3 * quater {
      area[3] += area[2]
    }

    if prefixSum[i] == 2 * quater {
      area[2] += area[1]
    }

    if prefixSum[i] == quater {
      area[1] += area[0]
    }

  }

  print(area[3])
}