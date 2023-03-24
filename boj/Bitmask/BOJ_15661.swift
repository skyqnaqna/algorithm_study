/*
 백준 15661 링크와 스타트
 23.03.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var total = 0
var stat = [[Int]]()

for _ in 0 ..< n {
  stat.append(readLine()!.split(separator: " ").map { Int(String($0))! })
  total += stat.last?.reduce(0, +) ?? 0
}

var answer = total

for team in 1 ..< (1 << n) {
  var startTeam = [Int](), linkTeam = [Int]()
  var start = 0, link = 0

  for i in 0 ..< n {
    if (team & (1 << i) != 0) {
      for j in startTeam {
        start += stat[j][i]
        start += stat[i][j]
      }
      startTeam.append(i)
    } else {
      for j in linkTeam {
        link += stat[j][i]
        link += stat[i][j]
      }
      linkTeam.append(i)
    }
  }

  answer = min(answer, abs(start - link))
}

print(answer)
