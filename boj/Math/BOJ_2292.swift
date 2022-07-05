/*
 백준 2292 벌집
 22.07.05
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let target = Int64(readLine()!)!

var pre = 1, i = 0

while pre + i * 6 < target {
  pre += i * 6
  i += 1
}

print(i + 1)
