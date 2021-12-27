/*
 백준 1359 복권
 21.12.27
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]
var k = input[2]

var combi = [[Int]](repeating: [Int](repeating: 1, count: 9), count: 9)

for i in 2 ..< 9 {
  for j in 1 ..< i {
    combi[i][j] = combi[i-1][j] + combi[i-1][j-1]
  }
}

let total = combi[n][m]
var cnt = 1

while k < m {
  if m - k <= n - m {
    cnt += combi[m][k] * combi[n-m][m-k]
  }
  k += 1
}

print(Double(cnt) / Double(total))
