/*
 프로그래머스 단어 변환
 22.04.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func getDiff(_ a: String, _ b: String) -> Int {
  var res = 0
  let A = Array(a), B = Array(b)
  
  for i in A.indices {
    if A[i] != B[i] { res += 1 }
  }
  
  return res
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
  var dist = [Int](repeating: 0, count: words.count)
  var q = [(String, Int)](), front = 0
  var answer = 0
  q.append((begin, 0))
  
  while front < q.count {
    let (now, d) = q[front]
    front += 1
    
    if now == target {
      answer = d
      break
    }
    
    for i in words.indices {
      if dist[i] == 0 && getDiff(now, words[i]) == 1 {
        q.append((words[i], d + 1))
        dist[i] = d + 1
      }
    }
  }
  
  return answer
}
