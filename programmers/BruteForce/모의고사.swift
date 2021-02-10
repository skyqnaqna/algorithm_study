//  프로그래머스 모의고사
//  21.02.10

import Foundation

func solution(_ answers:[Int]) -> [Int] {
  var ans: [Int] = []
  let a: [Int] = [1, 2, 3, 4, 5]
  let b: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
  let c: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
  var score = Array(repeating: 0, count: 3)
  
  for i in 0..<answers.count {
    if answers[i] == a[i % a.count] { score[0] += 1 }
    if answers[i] == b[i % b.count] { score[1] += 1 }
    if answers[i] == c[i % c.count] { score[2] += 1 }
  }
  

  for i in 0...2 {
    if score[i] == score.max() {
      ans.append(i + 1)
    }
  }
  
  return ans
}

print(solution([1, 2, 3, 4, 5]))
