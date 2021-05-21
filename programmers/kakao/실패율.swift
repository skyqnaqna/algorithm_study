// 프로그래머스 실패율
// 21.05.21

import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
  var noneClear = [Int](repeating: 0, count: N + 2)
  var failureRate = [(Double, Int)]()

  for stage in stages {
    noneClear[stage] += 1
  }

  var clear = stages.count

  for i in 1...N {
    clear -= noneClear[i - 1]
    failureRate.append((Double(noneClear[i]) / Double(clear), i))
  }

  return failureRate.sorted(by: { $0.0 > $1.0 }).map { $0.1 }
}

print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
print(solution(4, [4,4,4,4,4]))