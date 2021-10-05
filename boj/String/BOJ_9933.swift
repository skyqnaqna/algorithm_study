/*
 21.10.06
 백준 9933 민균이의 비밀번호
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var file = Set<String>()
var ans = 0, mid = ""

for _ in 0 ..< n {
  file.insert(readLine()!)
}

for str in file {
  let rstr = String(str.reversed())
  if str == rstr || file.contains(rstr) {
    ans = str.count
    mid = str.map { String($0) }[ans / 2]
    break
  }
}

print(ans, mid)
