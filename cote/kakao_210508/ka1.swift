// 2021 카카오 인턴십 1

import Foundation

func solution(_ s:String) -> Int {
  let words = ["zero": "0",
               "one": "1",
               "two": "2",
               "three": "3",
               "four": "4",
               "five": "5",
               "six": "6",
               "seven": "7",
               "eight": "8",
               "nine": "9"]

  var str = ""
  var answer = ""
  for char in s {
    if char > "9" {
      str += String(char)
    } else {
      answer += String(char)
    }

    if let temp = words[str] {
      answer += temp
      str = ""
    }
  }
  return Int(answer)!
}

print(solution("one4seveneight"))
print(solution("23four5six7"))