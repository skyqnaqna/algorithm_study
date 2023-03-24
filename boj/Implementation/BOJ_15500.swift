/*
 백준 15500 이상한 하노이 탑
 23.03.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var target = n
var stack = [[Int]](repeating: [Int](), count: 2)

stack[0] = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = ""
var cnt = 0
var pos = 0

while target > 0 {
  while let top = stack[pos].last, top != target {
    stack[(pos + 1) % 2].append(stack[pos].removeLast())
    cnt += 1
    answer += "\(pos + 1) \((pos + 1) % 2 + 1)\n"
  }

  stack[pos].removeLast()
  answer += "\(pos + 1) \(3)\n"
  cnt += 1
  target -= 1

  if stack[0].isEmpty { pos = 1 }
  else if stack[1].isEmpty { pos = 0 }
  else {
    pos = stack[0].max()! == target ? 0 : 1
  }
}

print(cnt, answer, separator: "\n")
