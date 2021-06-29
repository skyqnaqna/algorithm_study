/*
 백준 N-Queen
 21.06.29
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var col = [Bool](repeating: false, count: n)
var diagonal1 = [Bool](repeating: false, count: 2 * n)
var diagonal2 = [Bool](repeating: false, count: 2 * n)
var answer = 0

func backtracking(_ row: Int) {
  if row == n {
    answer += 1
  } else {
    for i in 0 ..< n {
      if !col[i] && !diagonal1[row + i] && !diagonal2[row - i + n - 1] {
        col[i] = true
        diagonal1[row + i] = true
        diagonal2[row - i + n - 1] = true
        backtracking(row + 1)
        col[i] = false
        diagonal1[row + i] = false
        diagonal2[row - i + n - 1] = false
      }
    }
  }
}

backtracking(0)

print(answer)
