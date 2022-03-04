/*
 백준 17214 다항 함수의 적분
 22.03.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let exp = readLine()!.map { String($0) }

var answer = [String]()
var str = ""

func integral(_ str: String) -> String {
  let arr = str.map { String($0) }
  var num = "", res = ""
  var i = 0
  while i < arr.count {
    if arr[i] == "x" { break }
    num += arr[i]
    i += 1
  }
  let exponent = arr.count - i + 1
  num = String(Int(num)! / exponent)
  
  if num == "0" { return res }
  else if num != "1" && num != "-1" { res = num }
  else if num == "-1" { res = "-" }
  
  for _ in 0 ..< exponent {
    res += "x"
  }
  
  return res
}

func check(_ input: String) {
  let res = integral(input)
  str = ""
  if res.isEmpty { return }
  answer.append(res)
}

for s in exp {
  if !str.isEmpty && (s == "+" || s == "-") {
    check(str)
    
    if s == "-" { str = "-" }
  } else {
    str += s
  }
}

check(str)

var result = ""

if answer.isEmpty {
  result = "W"
} else {
  result = answer[0]
  for i in 1 ..< answer.count {
    if answer[i].first! != "-" {
      result += "+"
    }
    result += answer[i]
  }
  
  result += "+W"
}

print(result)
