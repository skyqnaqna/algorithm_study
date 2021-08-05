/*
 백준 2217 로프
 21.08.05
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var rope = [Int]()

for _ in 0 ..< n {
  rope.append(Int(readLine()!)!)
}

rope.sort()

var ans = 0
for i in rope.indices {
  ans = max(ans, rope[i] * (n - i))
}

print(ans)