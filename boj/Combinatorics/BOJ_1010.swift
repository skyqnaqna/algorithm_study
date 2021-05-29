// 백준 1010 다리 놓기
// 21.05.29

import Foundation

var dp = [[Int]](repeating: [Int](repeating: 1, count: 30), count: 30)

for i in 2..<30 {
  for j in 1..<i {
    // nCr = n-1 C r + n-1 C r-1
    dp[i][j] = dp[i-1][j-1] + dp[i-1][j]
  }
}

let t = Int(readLine()!)!

for _ in 0..<t {
  let input = readLine()!.split(separator: " " ).map { Int(String($0))! }
  print(dp[input[1]][input[0]])
}