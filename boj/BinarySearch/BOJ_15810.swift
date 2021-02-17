//  백준 15810 풍선 공장
//  21.02.17

import Foundation
let INF: Int = 2147000000

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var times = readLine()!.split(separator: " ").map { Int(String($0))! }
var l = 0, r = times.min()!*m
var mid = (l + r) / 2, ans = r

while l <= r {
  var cnt = 0
  for i in times {
    cnt += mid / i
  }
  
  if cnt >= m {
    ans = min(ans, mid)
    r = mid - 1
  } else {
    l = mid + 1
  }
  mid = (l + r) / 2
}

print(ans)
