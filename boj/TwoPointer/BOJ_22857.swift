/*
 백준 22857 가장 긴 짝수 연속한 부분 수열 (small)
 22.03.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], k = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var l = 0, r = 0, cnt = 0, nextL = 0, answer = 0
while r < n {
  if arr[r] & 1 == 0 {
    r += 1
  } else {
    if cnt == 0 {
      nextL = r
      r += 1
      cnt += 1
    } else if cnt < k {
      cnt += 1
      r += 1
    } else {
      answer = max(answer, r - l - k)
      l = nextL + 1
      r = l
      cnt = 0
    }
  }
}

answer = max(answer, r - l - cnt)

print(answer)
