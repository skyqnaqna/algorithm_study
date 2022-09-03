/*
 백준 11497 통나무 건너뛰기
 22.09.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let t = Int(readLine()!)!
var answer = ""

for _ in 0 ..< t {
  _ = Int(readLine()!)!

  var arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
  var left = arr.last!, right = arr.removeLast()
  var maxVal = 0

  while !arr.isEmpty {
    if maxVal < left - arr.last! {
      maxVal = left - arr.last!
    }

    left = arr.removeLast()

    if arr.isEmpty { break }

    if maxVal < right - arr.last! {
      maxVal = right - arr.last!
    }

    right = arr.removeLast()
  }

  if maxVal < left - right {
    maxVal = left - right
  }

  answer += "\(maxVal)\n"
}

print(answer)
