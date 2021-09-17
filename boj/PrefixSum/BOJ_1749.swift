/*
 백준 1749 점수따먹기
 21.09.18
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)

var ans = -11111

for i in 1 ... n {
  let row = readLine()!.split(separator: " ").map { Int(String($0))! }

  for j in 1 ... m {
    prefixSum[i][j] = row[j - 1] + prefixSum[i][j - 1]
  }
}

for j in 1 ... m {
  for i in 1 ... n {
    prefixSum[i][j] += prefixSum[i - 1][j]
  }
}

for i in 1 ... n {
  for j in 1 ... m {
    for s in 1 ... i {
      for e in 1 ... j {
        let sum = prefixSum[i][j] - prefixSum[s - 1][j] - prefixSum[i][e - 1] + prefixSum[s - 1][e - 1]

        if sum > ans {
          ans = sum
        }
      }
    }
  }
}

print(ans)