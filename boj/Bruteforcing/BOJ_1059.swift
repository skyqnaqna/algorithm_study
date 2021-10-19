/*
 21.10.20
 백준 1059 좋은 구간
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var s = Set<Int>()
let l = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = Int(readLine()!)!


for a in arr {
  s.insert(a)
}

if s.contains(n) {
  print(0)
} else {
  var left = n, right = n
  
  while true {
    if left == 1 { break }
    if s.contains(left - 1) { break }
    left -= 1
  }
  
  while true {
    if right == 1000 { break }
    if s.contains(right + 1) { break }
    right += 1
  }
  
  print((n - left + 1) * (right - n + 1) - 1)
}

