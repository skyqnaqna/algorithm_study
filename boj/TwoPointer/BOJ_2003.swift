//  백준 2003 수들의 합 2
//  21.02.17

import Foundation

let n = readLine()!.split(separator: " ").map { Int($0)! }
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var p1 = 0
var p2 = 0
var ans = 0
var temp = 0

while p1 < n[0] {
  if p2 == n[0] {
    temp -= arr[p1]
    p1 += 1
  } else if temp < n[1] {
    temp += arr[p2]
    p2 += 1
  } else {
    temp -= arr[p1]
    p1 += 1
  }
  if temp == n[1] { ans += 1 }
}

print(ans)
