// 백준 10825 국영수
// 21.05.21

import Foundation

let n = Int(readLine()!)!
var students = [(String, Int, Int, Int)]()

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map { String($0) }
  students.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

students.sort(by: {
  if $0.1 != $1.1 {
    return $0.1 > $1.1
  } else if $0.2 != $1.2 {
    return $0.2 < $1.2
  } else if $0.3 != $1.3 {
    return $0.3 > $1.3
  } else {
    return $0.0 < $1.0
  }
})

print(students.map { String($0.0) }.joined(separator: "\n"))