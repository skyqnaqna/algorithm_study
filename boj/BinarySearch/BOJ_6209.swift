/*
 백준 6209 제자리 멀리뛰기
 22.06.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let d = input[0], n = input[1], m = input[2]

var arr = [Int]()

for _ in 0 ..< n {
  arr.append(Int(readLine()!)!)
}

arr.sort(by: <)
arr.append(d)

var l = 1, r = d, mid = 0, answer = 0

while l <= r {
  mid = (l + r) / 2
  
  var pre = 0, cnt = 0, res = d
  
  for val in arr {
    if mid <= val - pre {
      cnt += 1
      res = min(res, val - pre)
      pre = val
    }
  }
  
  if n - m < cnt {
    l = mid + 1
    answer = max(answer, res)
  } else {
    r = mid - 1
  }
}

print(answer)

