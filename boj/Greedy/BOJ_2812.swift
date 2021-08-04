/*
 백준 2812 크게 만들기
 21.08.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], k = input[1]
let size = n - k

var stack = [String]()
let number = readLine()!.map{ String($0) }

for i in number.indices {
  if stack.isEmpty {
    stack.append(number[i])
  } else if size - stack.count == n - i {
    stack.append(number[i])
  } else if stack.last! < number[i] {
    while !stack.isEmpty && stack.count + n - i > size && stack.last! < number[i] {
      stack.removeLast()
    }
    stack.append(number[i])
  } else if stack.count < size {
    stack.append(number[i])
  }
}

print(stack.map{ String($0) }.joined(separator: ""))