/*
 프로그래머스 비밀지도
 21.12.31
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
  var answer: [String] = []
  
  for i in 0 ..< n {
    var ans = ""
    let res = String(format: "%\(n)ld", Int(String(arr1[i] | arr2[i], radix: 2))!)
    
    for k in res {
      if k == "1" {
        ans += "#"
      } else {
        ans += " "
      }
    }
    
    answer.append(ans)
  }
  
  return answer
}
