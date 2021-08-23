/*
 백준 15831 준표의 조약돌
 21.08.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], b = input[1], w = input[2]

let str = readLine()!
var arr = [Int]()
for s in str {
  if s == "W" {
    arr.append(1)
  } else {
    arr.append(0)
  }
}
var l = 0, r = 0, ans = 0, bw = [Int](repeating: 0, count: 2)

while l < n {
  if r == n {
    bw[arr[l]] -= 1
    l += 1
  } else if bw[0] <= b {
    bw[arr[r]] += 1
    r += 1
  } else {
    bw[arr[l]] -= 1
    l += 1
  }

  if bw[0] <= b && bw[1] >= w {
    ans = max(ans, r - l)
  }
}

print(ans)