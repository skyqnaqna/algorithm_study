/*
 프로그래머스 양궁대회
 22.02.18
 */

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
  var score = -1
  var target = [Int](repeating: 0, count: 11)
  var answer = [String]()
  
  func recursive(_ cnt: Int, _ idx: Int) {
    if cnt == n {
      var apeach = 0, lion = 0
      
      for i in 0 ..< 11 {
        if target[i] == 0 && info[i] == 0 { continue }
        if target[i] <= info[i] {
          apeach += 10 - i
        } else {
          lion += 10 - i
        }
      }
      
      if apeach < lion && lion - apeach >= score {
        if lion - apeach == score {
          answer.append(target.reversed().map { String($0) }.joined())
        } else if lion - apeach > score {
          score = lion - apeach
          answer.removeAll()
          answer.append(target.reversed().map { String($0) }.joined())
        }
      }
      return
    }
    
    for i in idx ..< 11 {
      target[i] += 1
      recursive(cnt + 1, i)
      target[i] -= 1
    }
  }
  
  recursive(0, 0)
  
  answer.sort()
  
  return score == -1 ? [-1] : answer.last!.map { Int(String($0))! }.reversed()
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0] ))
