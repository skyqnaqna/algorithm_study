//  백준 14921 용액 합성하기
//  21.02.18

import Foundation
let INF: Int = 2147000000

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var l = 1, r = k, ans = Int.max
var m = (l + r) / 2

while l <= r {
  var cnt = 0
  for i in 1...n {
    cnt += min(n, m / i)
  }
  
  if cnt >= k {
    ans = min(ans, m)
    r = m - 1
  } else { l = m + 1 }
  m = (l + r) / 2
}

print(ans)
