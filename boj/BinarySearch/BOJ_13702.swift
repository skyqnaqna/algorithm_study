//  백준 13702 이상한 술집
//  22.02.17

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]
var mak: [Int] = []
for _ in 0..<n {
  mak.append(Int(readLine()!)!)
}

var l: Int = 0
var r: Int = mak.max()!
var m: Int = (l + r) / 2
var ans: Int = n == k ? mak.min()! : 0

while l <= r {
  if m == 0 { break }
  var cnt: Int = 0
  for i in mak {
    cnt += i / m
  }
  
  if cnt >= k {
    ans = max(ans, m)
    l = m + 1
  } else {
    r = m - 1
  }
  
  m = (l + r ) / 2
}

print(ans)

