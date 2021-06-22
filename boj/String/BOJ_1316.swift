/*
 백준 1316 그룹 단어 체커
 21.06.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

func check() -> Bool {
  var answer = true
  var alphabet = Set<Character>()


  let str: [Character] = Array(readLine()!.map{ $0 })
  var pre = str[0]
  alphabet.insert(pre)

  for i in 1..<str.count {
    if str[i] != pre {
      if !alphabet.contains(str[i]) {
        pre = str[i]
        alphabet.insert(pre)
      } else {
        answer = false
        break
      }
    }
  }

  return answer
}

var result = 0
for _ in 0..<n {
  if check() { result += 1 }
}
print(result)
