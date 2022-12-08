/*
 백준 16507 어두운 건 무서워
 22.12.08
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = input[0], c = input[1], q = input[2]

var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: c + 1), count: r + 1)

for i in 1 ... r {
  let brightness = readLine()!.split(separator: " ").map { Int(String($0))! }

  for j in 1 ... c {
    prefixSum[i][j] += prefixSum[i][j - 1] + brightness[j - 1]
  }
}

for j in 1 ... c {
  for i in 1 ... r {
    prefixSum[i][j] += prefixSum[i - 1][j]
  }
}

var answer = ""

for _ in 0 ..< q {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }

  let r1 = i[0], c1 = i[1], r2 = i[2], c2 = i[3]

  let cnt = (r2 - r1 + 1) * (c2 - c1 + 1)

  let res = (prefixSum[r2][c2] - prefixSum[r1 - 1][c2] - prefixSum[r2][c1 - 1] + prefixSum[r1 - 1][c1 - 1]) / cnt

  answer += "\(res)\n"
}

print(answer)
