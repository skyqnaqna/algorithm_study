/*
 백준 2417 정수 제곱근
 22.02.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = UInt64(readLine()!)!

if n == 0 { print(0) }
else {
  var l: UInt64 = 0, r = UInt64(sqrt(Double(UInt64.max))) + 1, ans: UInt64 = 0
  
  while l <= r {
    let mid = (l + r) / 2
    
    if n <= mid * mid {
      ans = mid
      r = mid - 1
    } else {
      l = mid + 1
    }
  }
  
  print(ans)
}

