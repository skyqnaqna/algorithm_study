/*
 백준 2417 정수 제곱근
 21.08.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var l = 0, r = n, ans = n

let sqrtN = sqrt(Double(n))
while l <= r {
  let mid = (l + r) / 2

  if Double(mid) >= sqrtN {
    ans = min(ans, mid)
    r = mid - 1
  } else {
    l = mid + 1
  }
}

print(ans)