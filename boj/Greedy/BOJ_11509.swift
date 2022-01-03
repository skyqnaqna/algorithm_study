/*
 11509 풍선 맞추기
 22.01.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let balloons = readLine()!.split(separator: " ").map { Int(String($0))! }

var arrows = [Int](repeating: 0, count: 1000001)
var answer = 0

for balloon in balloons {
  if arrows[balloon + 1] == 0 {
    arrows[balloon] += 1
    answer += 1
  } else {
    arrows[balloon + 1] -= 1
    arrows[balloon] += 1
  }
}

print(answer)
