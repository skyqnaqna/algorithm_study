/*
 백준 21925 짝수 팰린드롬
 22.03.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

func check(_ s: Int, _ e: Int) -> Bool {
  var l = s, r = e
  
  while (l < r) {
    if arr[l] != arr[r] {
      return false
    }
    
    l += 1
    r -= 1
  }
  
  return true
}

var l = 0, r = 1, answer = 0

while r < n {
  if (r - l + 1) % 2 == 0 {
    if check(l, r) {
      answer += 1
      l = r + 1
      r += 2
    } else {
      if r == n - 1 {
        answer = -1
      }
      r += 1
    }
  } else {
    r += 1
  }
}

print(answer)
