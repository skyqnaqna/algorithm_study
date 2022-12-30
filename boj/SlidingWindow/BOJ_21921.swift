/*
 백준 21921 블로그
 22.12.29
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], x = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var l = 0, r = x

var sum = 0, cnt = 0, maxSum = 0

for i in 0 ..< x { sum += arr[i] }

maxSum = sum
cnt = 1

while r < n {
  sum += arr[r]
  sum -= arr[l]
  r += 1
  l += 1

  if maxSum < sum {
    maxSum = sum
    cnt = 1
  } else if maxSum == sum {
    cnt += 1
  }
}

if maxSum == 0 {
  print("SAD")
} else {
  print(maxSum, cnt, separator: "\n")
}
