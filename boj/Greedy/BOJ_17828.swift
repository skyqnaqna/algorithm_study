/*
 백준 17828 문자열 화폐
 23.01.06
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], x = input[1]

func intToString(_ val: Int) -> String {
  return String(UnicodeScalar(Int(Character("A").asciiValue!) + (val - 1))!)
}

if n * 26 < x || x < n {
  print("!")
} else {

  var answer = ""
  var xVal = x

  for i in 1 ... n {
    if i == n {
      answer += intToString(xVal)
      break
    }

    for val in 1 ... 26 {
      if xVal - val <= (n - i) * 26 {
        xVal -= val
        answer += intToString(val)
        break
      }
    }
  }

  print(answer)
}

