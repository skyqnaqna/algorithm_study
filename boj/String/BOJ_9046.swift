/*
 백준 9046 복호화
 21.06.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
  print(solution())
}

func solution() -> Character {
  let str = readLine()!
  var count = [Int](repeating: 0, count: 30)

  var answer: Character?
  var maxCount = 0

  for char in str {
    if char != " " {
      let idx = Int(char.asciiValue! - Character("a").asciiValue!)

      count[idx] += 1

      if count[idx] > maxCount {
        maxCount = count[idx]
        answer = char
      }
    }
  }

  for i in 0...26{
    guard Character(UnicodeScalar(UInt8(i) + Character("a").asciiValue!)) != answer && count[i] == maxCount else {
      continue
    }

    answer = "?"
    break
  }

  return answer!
}