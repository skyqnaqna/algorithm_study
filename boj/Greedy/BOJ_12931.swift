/*
 백준 12931 두 배 더하기
 21.08.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var b = readLine()!.split(separator: " ").map{ Int(String($0))! }
var ans = 0, zero = 0

func check() -> Bool {
  zero = 0
  for x in b {
    if x == 0 { zero += 1 }
    if x % 2 != 0 {
      return false
    }
  }
  return true
}

while true {
  if zero == n { break }
  if check() {
    if zero == n { break }
    for i in b.indices {
      b[i] >>= 1
    }
    ans += 1
  } else {
    for i in b.indices {
      if b[i] > 0 && b[i] % 2 != 0 {
        b[i] -= 1
        ans += 1
      }
    }
  }
}

print(ans)