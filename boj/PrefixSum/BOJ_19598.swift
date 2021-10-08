/*
 21.10.08
 백준 19598 최소 회의실 개수
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var arr = [(Int, Int)]()

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  arr.append((input[0], 1))
  arr.append((input[1], -1))
}

arr.sort(by: < )
//print(arr)

//arr.sort(by: {
//  if $0.0 == $1.0 {
//    return $0.1 < $1.1
//  } else {
//    return $0.0 < $1.0
//  }
//})
//print(arr)

var sum = 0, ans = 0

for (_, x) in arr {
  sum += x
  if ans < sum {
    ans = sum
  }
}

print(ans)
