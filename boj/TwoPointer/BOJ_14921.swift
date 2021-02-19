//  백준 14921 용액 합성하기
//  21.02.18

import Foundation
let INF: Int = 2147000000

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var l = 0, r = n - 1, ans = INF

while l < r {
  let temp = arr[l] + arr[r]
  if abs(ans) > abs(temp) { ans = temp }
  
  if temp == 0 { break }
  else if temp < 0 { l += 1 }
  else { r -= 1 }
}
print(ans)
