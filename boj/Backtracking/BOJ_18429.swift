/*
 백준 18429 근손실
 22.11.25
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], k = input[1]
let kit = readLine()!.split(separator: " ").map { Int(String($0))! }

var isUsed = [Bool](repeating: false, count: n)

var answer = 0

func recursive(_ day: Int, _ weight: Int) {
  if weight < 500 { return }
  if day == n {
    answer += 1
    return
  }

  for i in 0 ..< n {
    if isUsed[i] { continue }

    isUsed[i] = true
    recursive(day + 1, weight + kit[i] - k)
    isUsed[i] = false
  }
}

recursive(0, 500)

print(answer)
