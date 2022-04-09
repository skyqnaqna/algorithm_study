/*
 프로그래머스 기능개발
 22.04.08
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
  var answer = [Int]()
  var q = [Int](), front = 0
  
  for i in progresses.indices {
    var day = (100 - progresses[i]) / speeds[i]
    
    if (100 - progresses[i]) % speeds[i] != 0 {
      day += 1
    }
    
    q.append(day)
  }
  
  var cnt = 1
  var pre = q[front]
  front += 1
  
  while front < q.count {
    if q[front] <= pre {
      cnt += 1
      front += 1
    } else {
      answer.append(cnt)
      cnt = 1
      pre = q[front]
      front += 1
    }
  }
  
  answer.append(cnt)
  
  return answer
}
