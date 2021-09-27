/*
 21.09.27
 백준 15489 파스칼 삼각형
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var paskal = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)
var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)

for i in 1 ... 30 {
  for j in 1 ... 30 {
    if j == 1 || j == i {
      paskal[i][j] = 1
    } else {
      paskal[i][j] = paskal[i-1][j-1] + paskal[i-1][j]
    }
    
    prefixSum[i][j] = prefixSum[i-1][j] + paskal[i][j]
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var r = input[0], c = input[1], w = input[2]

var answer = 0

let row = r + w - 1
while w > 0 {
  answer += prefixSum[row][c] - prefixSum[row - w][c]
  c += 1
  w -= 1
}

print(answer)
