/*
 백준 2346 풍선 터뜨리기
 23.02.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Deque<T> {
  var left = [T]()
  var right = [T]()
  var isEmpty: Bool { return left.isEmpty && right.isEmpty }

  init(_ arr: [T]) {
    right = arr
  }

  mutating func push(_ item: T) {
    right.append(item)
  }

  mutating func pushFront(_ item: T) {
    left.append(item)
  }

  mutating func pop() -> T {
    if right.isEmpty {
      return left.removeFirst()
    }

    return right.removeLast()
  }

  mutating func popFront() -> T {
    if left.isEmpty {
      return right.removeFirst()
    }

    return left.removeLast()
  }
}

let n = Int(readLine()!)!

var dq = Deque<(Int, Int)>(readLine()!.split(separator: " ")
  .enumerated()
  .map { (Int(String($1))!, $0) })

var pre = dq.popFront()
var answer = [pre.1 + 1]
var cnt = abs(pre.0)
var isPositive = pre.0 > 0 ? true : false

while !dq.isEmpty {
  for _ in 0 ..< cnt - 1 {
    if isPositive {
      pre = dq.popFront()
      dq.push(pre)
    } else {
      pre = dq.pop()
      dq.pushFront(pre)
    }
  }

  if isPositive {
    pre = dq.popFront()
  } else {
    pre = dq.pop()
  }
  cnt = abs(pre.0)
  answer.append(pre.1 + 1)
  isPositive = pre.0 > 0 ? true : false
}

print(answer.map { String($0) }.joined(separator: " "))
