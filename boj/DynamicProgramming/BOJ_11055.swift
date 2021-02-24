// 백준 11055 가장 큰 증가 부분 수열
// 21.02.24

import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int(String($0))! }
var d = Array(repeating: 0, count: n)

d[0] = a[0]
var ans = d[0]
for i in stride(from: 1, to: n, by: 1) {
  d[i] = a[i]
  
  for j in stride(from: 0, to: i, by: 1) {
    if a[j] < a[i] && d[i] < d[j] + a[i] { d[i]  = d[j] + a[i] }
  }
  ans = max(ans, d[i])
}

print(ans)
