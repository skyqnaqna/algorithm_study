/*
 백준 1094 막대기
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let x = Int(readLine()!)!

var stick = (1 << 6)

while stick != x {
  var i = 0
  
  while (stick & (1 << i)) == 0 && i < 7 {
    i += 1
  }
  
  if stick >= x {
    stick &= ~(1 << i)
  }
  stick |= (1 << (i - 1))
}

var cnt = 0
while stick != 0 {
  if (stick & 1) != 0 {
    cnt += 1
  }
  stick >>= 1
}

print(cnt)
