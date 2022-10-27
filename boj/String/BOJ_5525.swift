/*
 백준 5525 IOIOI
 22.10.27
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

let str = readLine()!.map { String($0) }
var len = [Int](repeating: 0, count: m)

var pos = 0, answer = 0

while pos < m - 2 {
  if str[pos] == "I" {
    if str[pos + 1] == "O" && str[pos + 2] == "I" {
      len[pos + 2] = len[pos] + 1
      pos += 2
      if len[pos] >= n { answer += 1 }
    } else {
      pos += 1
    }
  } else {
    pos += 1
  }
}

print(answer)
