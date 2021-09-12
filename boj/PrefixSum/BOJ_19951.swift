/*
 백준 19951 태상이의 훈련소 생활
 21.09.13
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
var m = input[1]

var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var prefixSum = [Int](repeating: 0, count: n + 1)

while m > 0 {
  m -= 1

  let info = readLine()!.split(separator: " ").map { Int(String($0))! }

  prefixSum[info[0] - 1] += info[2]
  prefixSum[info[1]] -= info[2]
}

arr[0] += prefixSum[0]
for i in 1 ..< n {
  prefixSum[i] += prefixSum[i - 1]
  arr[i] += prefixSum[i]
}

for ans in arr {
  print(ans, terminator: " ")
}