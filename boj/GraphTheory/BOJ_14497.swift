/*
 백준 14497 주난의 난
 23.02.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Deque<T> {
  var left = [T]()
  var right = [T]()
  var count: Int { return left.count + right.count }
  var isEmpty: Bool { return left.isEmpty && right.isEmpty }

  var front: T {
    if left.isEmpty {
      return right.first!
    }
    return left.last!
  }

  var back: T {
    if right.isEmpty {
      return left.first!
    }

    return right.last!
  }

  init(_ arr: [T] = []) {
    self.right = arr
  }

  mutating func pushLast(_ item: T) {
    right.append(item)
  }

  mutating func pushFront(_ item: T) {
    left.append(item)
  }

  mutating func popLast() -> T {
    if right.isEmpty {
      right = left.reversed()
      left.removeAll()
    }

    return right.removeLast()
  }

  mutating func popFront() -> T {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }

    return left.removeLast()
  }

  func find(at idx: Int) -> T? {
    let arr = left.reversed() + right
    for i in arr.indices {
      if i == idx { return arr[i] }
    }

    return nil
  }

}

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let xy = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
let x1 = xy[0], y1 = xy[1], x2 = xy[2], y2 = xy[3]

var graph = [[String]]()
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for _ in 0 ..< n {
  graph.append(readLine()!.map { String($0) })
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 ..< n ~= r && 0 ..< m ~= c
}

var answer = 0
var q = Deque<(Int ,Int, Int)>()

q.pushLast((x1, y1, 0))
isVisited[x1][y1] = true

while !q.isEmpty {
  let (r, c, cnt) = q.popFront()

  if r == x2 && c == y2 {
    answer = cnt
    break
  }

  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx

    if !inBound(nr, nc) || isVisited[nr][nc] { continue }

    isVisited[nr][nc] = true

    if graph[nr][nc] != "0" {
      q.pushLast((nr, nc, cnt + 1))
    } else {
      q.pushFront((nr, nc, cnt))
    }
  }
}

print(answer)
