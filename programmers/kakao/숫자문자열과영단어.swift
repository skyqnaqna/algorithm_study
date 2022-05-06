/*
 프로그래머스 숫자 문자열과 영단어
 22.05.06
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ s:String) -> Int {
  
  var res = s
  
  let table = ["zero": "0", "one": "1", "two": "2",
               "three": "3", "four": "4", "five": "5",
               "six": "6", "seven": "7", "eight": "8",
               "nine": "9"]
  
  for (key, value) in table {
    if res.contains(key) {
      res = res.replacingOccurrences(of: key, with: value)
    }
  }
  
  return Int(res)!
}

print(solution("one4seveneight"))
