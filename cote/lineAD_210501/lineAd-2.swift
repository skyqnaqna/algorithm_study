// 라인AD 인턴 2번
// 21.05.03

import Foundation

func solution(_ array:[Int]) -> [Int] {
  var result = [Int](repeating: -1, count: array.count)
  var stack = [Int]()

  for i in stride(from: 0, to: array.count, by: 1) {
    while !stack.isEmpty && array[stack.last!] <= array[i] {
      if array[stack.last!] == array[i] {
        if result[stack.last!] > -1 {
          stack.removeLast()
        } else if result[stack.last!] == -1 {
          break
        }
      } else if array[stack.last!] < array[i] {
        if result[stack.last!] == -1 || stack.last! - result[stack.last!] > i - stack.last! {
          result[stack.last!] = i
        }
        stack.removeLast()
      }
    }
    if !stack.isEmpty && array[stack.last!] > array[i] {
      result[i] = stack.last!
    }
    stack.append(i)
  }
  return result
}

print(solution([3,5,4,1,2]))
print(solution([1,1,1,1,1]))
print(solution([5,4,2,1,3]))
print(solution([1,1,4,1,1]))