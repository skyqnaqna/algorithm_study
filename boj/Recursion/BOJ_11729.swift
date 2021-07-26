/*
 백준 11729 하노이 탑 이동 순서
 21.07.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

print(1<<n - 1)

var ans = ""

func hanoi(_ from: Int, _ to: Int, _ k: Int) {
  if k == 1 {
    ans += "\(from) \(to)\n"
    return
  }
  hanoi(from, 6 - from - to, k - 1)
  ans += "\(from) \(to)\n"
  hanoi(6 - from - to, to, k - 1)
}

hanoi(1, 3, n)
print(ans)