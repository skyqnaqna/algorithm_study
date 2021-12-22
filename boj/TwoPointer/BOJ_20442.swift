/*
 백준 20442 ㅋㅋ루ㅋㅋ
 21.12.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let s = readLine()!.map { String($0) }

var left = [Int](), right = [Int]()
var cnt = 0

for c in s {
  if c == "K" {
    cnt += 1
  } else {
    left.append(cnt)
  }
}

cnt = 0
for c in s.reversed() {
  if c == "K" {
    cnt += 1
  } else {
    right.append(cnt)
  }
}

right.reverse()

var l = 0, r = right.count - 1, answer = 0

while l <= r {
  answer = max(answer, r - l + 1 + 2 * (min(left[l], right[r])))
  
  if left[l] < right[r] {
    l += 1
  } else {
    r -= 1
  }
}

print(answer)
