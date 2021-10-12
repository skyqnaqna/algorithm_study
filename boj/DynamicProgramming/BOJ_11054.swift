/*
 21.10.12
 백준 11054 가장 긴 바이토닉 부분 수열
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

// 0행은 왼쪽부터, 1행은 오른쪽부터 증가하는 긴 부분 수열의 길이 저장
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)

var left = 0, right = n - 1
// 양 끝은 길이가 1
dp[0][left] = 1
dp[1][right] = 1

left += 1
right -= 1

while left < n {
  var maxLen = 0
  for i in 0 ..< left {
    if arr[i] < arr[left] {
      maxLen = max(maxLen, dp[0][i])
    }
  }
  dp[0][left] = maxLen + 1
  
  maxLen = 0
  for i in right + 1 ..< n {
    if arr[i] < arr[right] {
      maxLen = max(maxLen, dp[1][i])
    }
  }
  dp[1][right] = maxLen + 1
  
  left += 1
  right -= 1
}

var answer = 0

for i in 0 ..< n {
  // i 번째 원소가 중복되므로 1을 빼줌
  if answer < dp[0][i] + dp[1][i] - 1 {
    answer = dp[0][i] + dp[1][i] - 1
  }
}

print(answer)
