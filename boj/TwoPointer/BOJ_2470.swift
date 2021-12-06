/*
 백준 2470 두 용액
 21.12.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()

var l = 0, r = n - 1
var val = Int(2e9), res1 = 0, res2 = 0

while l < r {
  let sum = arr[l] + arr[r]
  
  if abs(sum) < val {
    val = abs(sum)
    res1 = l
    res2 = r
  }
  
  if sum < 0 {
    l += 1
  } else if sum > 0 {
    r -= 1
  } else {
    break
  }
}

print(arr[res1], arr[res2], terminator: " ")
