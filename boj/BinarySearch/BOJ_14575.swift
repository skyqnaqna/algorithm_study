/*
 백준 14575 뒤풀이
 22.12.30
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], t = input[1]

var person = [(Int, Int)]()

var minTotal = 0, maxTotal = 0
var minLimit = 0

var l = Int(1e9), r = 0

for _ in 0 ..< n {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  person.append((i[0], i[1]))

  l = min(l, i[0])
  r = max(r, i[1])

  minTotal += i[0]
  maxTotal += i[1]
  minLimit = max(minLimit, i[0])
}

var s = -1

func isValid(_ val: Int) -> Bool {
  var sum = 0

  for (_, high) in person {
    sum += min(high, val)
  }

  return t <= sum
}

if minTotal <= t && t <= maxTotal {
  while l <= r {
    let m = (l + r) / 2

    if minLimit <= m && isValid(m) {
      s = m
      r = m - 1
    } else {
      l = m + 1
    }
  }
}

print(s)
