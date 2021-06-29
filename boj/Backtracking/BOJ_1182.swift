/*
 백준 1182 부분수열의 합
 21.06.29
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }

let n = input[0], s = input[1]

var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var answer = 0

func backtracking(_ sum: Int, _ idx: Int) {
  if idx == n {
    return
  } else {
    if sum + arr[idx] == s {
      answer += 1
    }
    backtracking(sum + arr[idx], idx + 1)
    backtracking(sum, idx + 1)
  }
}

backtracking(0, 0)

print(answer)
