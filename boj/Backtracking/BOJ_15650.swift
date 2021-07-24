/*
 백준 15650 N과 M (2)
 21.07.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0], m = input[1]
var permutation = [Int]()

  func backtracking(_ idx: Int, _ cnt: Int) {
  if cnt == m {
    print(permutation.map{ String($0) }.joined(separator: " "))
  } else {
    for i in idx ..< n {
      permutation.append(i + 1)
      backtracking(i + 1, cnt + 1)
      permutation.removeLast()
    }
  }
}

backtracking(0, 0)
