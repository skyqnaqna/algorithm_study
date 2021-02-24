// 백준 1309 동물원
// 21.02.24

import Foundation

let n = Int(readLine()!)!
var d = Array(repeating: Array(repeating: 0, count: 3), count: n)
let m = 9901

// d[k][0] : nothing / d[k][1] : left / d[k][2] : right
d[0][0] = 1; d[0][1] = 1; d[0][2] = 1

for i in stride(from: 1, to: n, by: 1) {
  d[i][0] = (d[i-1][0] + d[i-1][1] + d[i-1][2]) % m
  d[i][1] = (d[i-1][0] + d[i-1][2]) % m
  d[i][2] = (d[i-1][0] + d[i-1][1]) % m
}

print((d[n-1][0] + d[n-1][1] + d[n-1][2]) % m)
