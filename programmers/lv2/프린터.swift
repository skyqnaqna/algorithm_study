/*
 프로그래머스 프린터
 22.04.08
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
  var answer = [Int](repeating: 0, count: priorities.count)
  var q = [(Int, Int)]()
  let pri = priorities.sorted(by: >)
  var now = 0
  
  for (i, p) in priorities.enumerated() {
    q.append((p, i))
  }
  
  var front = 0, round = 1
  while front < q.count {
    let (p, i) = q[front]
    front += 1
    
    if p == pri[now] {
      answer[i] = round
      round += 1
      now += 1
    } else {
      q.append((p, i))
    }
  }
  
  return answer[location]
}
