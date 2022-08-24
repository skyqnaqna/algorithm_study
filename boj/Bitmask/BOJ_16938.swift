/*
 백준 16938 캠프 준비
 22.08.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], l = input[1], r = input[2], x = input[3]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

var answer = 0

for combi in 1 ..< (1 << n) {
  var min = arr.last!, max = 0, sum = 0, cnt = 0

  for i in 0 ..< n {
    if (combi & (1 << i)) != 0 {
      sum += arr[i]
      cnt += 1

      if max < arr[i] { max = arr[i] }
      if arr[i] < min { min = arr[i] }
    }
  }

  if 1 < cnt && l <= sum && sum <= r && x <= max - min { answer += 1 }
}

print(answer)
