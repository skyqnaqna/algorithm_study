// 백준 1463 1로 만들기
// 21.02.23

import Foundation

let n = Int(readLine()!)!

var d = Array(repeating: Int.max, count: 1000001)
d[1] = 0; d[2] = 1; d[3] = 1

for i in stride(from: 4, through: n, by: 1) {
  if i % 3 == 0 { d[i] = min(d[i], d[i / 3] + 1)}
  if i % 2 == 0 { d[i] = min(d[i], d[i / 2] + 1)}
  d[i] = min(d[i], d[i - 1] + 1)
}

print(d[n])
