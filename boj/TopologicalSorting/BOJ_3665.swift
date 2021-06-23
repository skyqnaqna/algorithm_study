/*
 백준 3665 최종 순위
 21.06.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Queue<T> {
  private var left = [T]()
  private var right = [T]()
  init() {}

  public var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }

  public var count: Int {
    return left.count + right.count
  }

  public mutating func push(_ element: T) {
    right.append(element)
  }

  public mutating func pop() -> T? {
    guard !isEmpty else { return nil }

    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }

    return left.removeLast()
  }

  public func peek() -> T? {
    return left.isEmpty ? right.first : left.last
  }
}

let t = Int(readLine()!)!

func solution() {
  let n = Int(readLine()!)!
  let lastYear = readLine()!.split(separator: " ").map{ Int(String($0))! }
  var graph = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: n + 1)
  var indegree = [Int](repeating: 0, count: n + 1)

  for i in 0 ..< n - 1 {
    for j in i + 1 ..< n {
      indegree[lastYear[j]] += 1
      graph[lastYear[i]][lastYear[j]] = true
    }
  }

  let m = Int(readLine()!)!

  for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let from = input[0], to = input[1]

    if graph[from][to] {
      graph[from][to] = false
      indegree[to] -= 1
      graph[to][from] = true
      indegree[from] += 1
    } else {
      graph[from][to] = true
      indegree[to] += 1
      graph[to][from] = false
      indegree[from] -= 1
    }
  }

  var answer = [Int]()
  var q = Queue<Int>()
  var notOnlyAnswer = false

  for i in 1 ... n {
    if indegree[i] == 0 {
      q.push(i)
    }
  }

  while !q.isEmpty {
    if q.count > 1 {
      notOnlyAnswer = true
      break
    }

    let now = q.pop()!
    answer.append(now)

    for i in 1 ... n {
      if graph[now][i] {
        graph[now][i] = false
        indegree[i] -= 1

        if indegree[i] == 0 {
          q.push(i)
        }
      }
    }
  }

  if notOnlyAnswer {
    print("?")
  } else if answer.count < n {
    print("IMPOSSIBLE")
  } else {
    for i in answer {
      print(i, terminator: " ")
    }
    print()
  }
}

for _ in 0 ..< t {
  solution()
}
