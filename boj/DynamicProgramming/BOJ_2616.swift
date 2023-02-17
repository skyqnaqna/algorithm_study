/*
 백준 2616 소형기관차
 23.02.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!

var kSum = [Int](repeating: 0, count: n + 1)
var sum = 0, l = 0, r = k - 1

for i in l ..< r { sum += arr[i] }

while r < n {
  sum += arr[r]
  r += 1
  kSum[r] = sum
  sum -= arr[l]
  l += 1
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 4)

for i in 1 ..< 4 {
  for j in k * (i - 1) + k ... n {
    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j - k] + kSum[j])
  }
}

print(dp[3][n])
