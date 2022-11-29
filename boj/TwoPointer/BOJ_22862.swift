/*
 백준 22862 가장 긴 짝수 연속한 부분 수열 (large)
 22.11.30
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], k = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! % 2 }

var answer = 1, cnt = 0, len = 1
var l = 0, r = 0

while l < n && arr[l] == 1 {
  l += 1
}

if l == n {
  print(0)
} else {
  r = l + 1

  while r < n {
    if arr[r] == 0 {
      len += 1
      if answer < len {
        answer = len
      }
    } else {
      if cnt == k {
        if arr[l] == 0 {
          len -= 1
        } else {
          cnt -= 1
        }

        l += 1
        continue

      } else {
        cnt += 1
      }
    }

    r += 1
  }

  print(answer)
}

