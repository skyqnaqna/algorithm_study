/*
 프로그래머스 이진 변환 반복하기
 22.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ s:String) -> [Int] {
  var x = s, answer = [0, 0]
  
  while x != "1" {
    let len = x.count
    let cnt = x.filter{ $0 == "1" }.count
    
    answer[0] += 1
    answer[1] += len - cnt
    
    x = String(cnt, radix: 2)
  }
  
  return answer
}
