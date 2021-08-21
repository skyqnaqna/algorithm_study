/*
 백준 10775 공항
 21.08.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let g = Int(readLine()!)!
var p = Int(readLine()!)!

var gate = [Int](repeating: 0, count: g + 1)
for i in gate.indices {
  gate[i] = i
}

func findGate(_ idx: Int) -> Int {
  if gate[idx] == idx {
    gate[idx] -= 1
    return idx
  } else {
    gate[idx] = findGate(gate[idx])
    return gate[idx]
  }
}

var ans = 0
while p > 0 {
  p -= 1

  let gi = Int(readLine()!)!

  if findGate(gi) != 0 {
    ans += 1
  } else {
    break
  }
}

print(ans)