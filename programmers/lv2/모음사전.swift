/*
 프로그래머스 모음사전
 22.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ word:String) -> Int {
  let alphabet = ["A", "E", "I", "O", "U"]
  var dic = Set<String>()
  var answer = 0
  
  func recursive(_ str: String, _ len: Int) {
    if len == 5 { return }
    
    for i in 0 ..< 5 {
      let next = str + alphabet[i]
      dic.insert(next)
      recursive(next, len + 1)
    }
  }
  
  recursive("", 0)
  
  for (i, str) in Array(dic).sorted(by: <).enumerated() {
    if str == word {
      answer = i
      break
    }
  }
  
  return answer + 1
}
