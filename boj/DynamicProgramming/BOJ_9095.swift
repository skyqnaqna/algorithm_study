// 백준 9095 1, 2, 3 더하기
// 21.02.23

import Foundation

var d = Array(repeating: 0, count: 12)
d[1] = 1; d[2] = 2; d[3] = 4

for i in stride(from: 4, to: 12, by: 1) {
  d[i] = d[i - 1] + d[i - 2] + d[i - 3]
}

var t = Int(readLine()!)!

while t > 0 {
  t -= 1
  print(d[Int(readLine()!)!])
}
