/*
 백준 6550 부분 문자열
 21.08.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

while true {
  guard let input = readLine() else {
    break
  }
  let sentence = input.split(separator: " ").map { String($0) }
  var left = Array(sentence[0]), right = sentence[1]

  left.reverse()

  for now in right {
    if left.isEmpty { break }
    if left.last! == now {
      left.removeLast()
    }
  }

  if left.isEmpty {
    print("Yes")
  } else {
    print("No")
  }
}