/*
 백준 17298 오큰수
 22.04.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = [Int](repeating: -1, count: n)
, stack = [Int]()

for i in stride(from: n - 1, through: 0, by: -1) {
  while !stack.isEmpty && stack.last! <= arr[i] {
    stack.removeLast()
  }
  
  if !stack.isEmpty {
    answer[i] = stack.last!
  }
  
  stack.append(arr[i])
}

print(answer.map { String($0) }.joined(separator: " "))
