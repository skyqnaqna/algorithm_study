/*
 백준 17219 비밀번호 찾기
 22.10.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]

var dict = [String: String]()

for _ in 0 ..< n {
  let i = readLine()!.split(separator: " ").map { String($0) }

  dict[i[0]] = i[1]
}

var answer = ""

for _ in 0 ..< m {
  let i = readLine()!

  answer += dict[i]! + "\n"
}

print(answer)
