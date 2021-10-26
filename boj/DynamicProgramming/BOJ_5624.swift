/*
 21.10.26
 백준 5624 좋은 수
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = 0
var sumSet = Set<Int>()

sumSet.insert(arr[0] * 2)

for i in 1 ..< n {
  for j in 0 ..< i {
    if sumSet.contains(arr[i] - arr[j]) {
      answer += 1
      break
    }
  }
  
  for j in 0 ... i {
    sumSet.insert(arr[i] + arr[j])
  }
}

print(answer)
