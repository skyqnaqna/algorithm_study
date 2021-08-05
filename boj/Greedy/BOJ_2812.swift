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
  } else if size - stack.count == n - i { // 채워야하는 수와 남아있는 수의 개수가 같으면 스택에 추가
    stack.append(number[i])
  } else if stack.last! < number[i] {
    // 현재 보고있는 수가 스택의 탑보다 크면 스택에서 빼고 넣을 것이기 때문에
    // "현재 스택의 크기 + 남아있는 숫자들의 개수"는 size 보다 커야한다
    while !stack.isEmpty && stack.count + n - i > size && stack.last! < number[i] {
      stack.removeLast()
    }
    stack.append(number[i])
  } else if stack.count < size { // 스택의 탑과 같거나 작은수는 size보다 작을 때 추가하기
    stack.append(number[i])
  }
}

print(stack.map{ String($0) }.joined(separator: ""))