/*
 백준 15651 N과 M (3)
 21.07.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0], m = input[1]
var permutation = [String]()

func backtracking(_ cnt: Int) {
  if cnt == m {
    print(permutation.joined(separator: " "))
  } else {
    for i in 1 ... n {
      permutation.append(String(i))
      backtracking(cnt + 1)
      permutation.removeLast()
    }
  }
}

backtracking(0)
