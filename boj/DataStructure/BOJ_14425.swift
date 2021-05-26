// 백준 14425 문자열 집합
// 21.05.26

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]

var words = Set<String>()

for _ in 0..<n {
  words.insert(readLine()!)
}

var answer = 0

for _ in 0..<m {
  if words.contains(readLine()!) {
    answer += 1
  }
}

print(answer)