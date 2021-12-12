/*
 백준 1253 좋다
 21.12.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var goodNum = Set<Int>()

func checkGoodNum(_ pos: Int) -> Bool {
  let val = arr[pos]
  var l = 0, r = n - 1
  
  while l < r {
    if l == pos {
      l += 1
      continue
    }
    if r == pos {
      r -= 1
      continue
    }
    
    if val < arr[l] + arr[r] {
      r -= 1
    } else if val > arr[l] + arr[r] {
      l += 1
    } else {
      return true
    }
  }
  return false
}

var answer = 0
for i in arr.indices {
  if goodNum.contains(arr[i]) {
    answer += 1
  } else if checkGoodNum(i) {
    answer += 1
    goodNum.insert(arr[i])
  }
}

print(answer)
