/*
 21.10.08
 백준 19598 최소 회의실 개수
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var timeSet = Set<Int>()
var query = [(Int, Int)]()

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  query.append((input[0], input[1]))
  
  timeSet.insert(input[0])
  timeSet.insert(input[1])
}

let timeArr = timeSet.map { $0 }.sorted(by: <)
var timeIdx = [Int: Int]()

for (i, t) in timeArr.enumerated() {
  timeIdx[t] = i
}

var prefixSum = [Int](repeating: 0, count: timeArr.count + 1)

for (s, e) in query {
  let l = timeIdx[s]!
  let r = timeIdx[e]!
  
  prefixSum[l] += 1
  prefixSum[r] -= 1
}

var ans = 0

for i in 1 ..< prefixSum.count {
  prefixSum[i] += prefixSum[i - 1]
  if ans < prefixSum[i] {
    ans = prefixSum[i]
  }
}

print(ans)

