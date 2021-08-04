/*
 백준 14501 퇴사
 21.08.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var t = [Int](), p = [Int](), ans = 0

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
  t.append(input[0])
  p.append(input[1])
}

func recursion(_ day: Int, _ sum: Int) {
  if day > n {
    return
  } else if day == n {
    ans = max(ans, sum)
  } else {
    let next = day + t[day]
    recursion(next, sum + p[day])
    recursion(day + 1, sum)
  }
}

recursion(0, 0)

print(ans)