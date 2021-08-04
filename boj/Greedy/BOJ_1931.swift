/*
 백준 1931 회의실 배정
 21.08.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var schedule = [(start: Int, end: Int)]()

for _ in 0 ..< n {
  let time = readLine()!.split(separator: " ").map { Int(String($0))! }
  schedule.append((time[0], time[1]))
}

schedule.sort(by: { if $0.end == $1.end { return $0.start < $1.start }
                    else { return $0.end < $1.end }})

var ans = 1, pre = schedule[0]
for i in 1 ..< n {
  if pre.end <= schedule[i].start {
    ans += 1
    pre = schedule[i]
  }
}

print(ans)