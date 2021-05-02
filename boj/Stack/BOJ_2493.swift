// 백준 2493 탑
// 21.05.02

import Foundation

let n = Int(readLine()!)!
var tops = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [Int](repeating: 0, count: n)
var stack = [Int]()

for i in stride(from: n - 1, through: 0, by: -1) {
  if stack.isEmpty {
    stack.append(i)
  } else {
    while !stack.isEmpty && tops[stack.last!] < tops[i] {
      let lowTopIndex = stack.popLast()!
      result[lowTopIndex] = i + 1
    }
    stack.append(i)
  }
}

for res in result {
  print(res, terminator: " ")
}
