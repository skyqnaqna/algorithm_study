// 백준 1939 중량제한
// 21.04.28

import Foundation

struct Queue<T> {
  private var left = [T]()
  private var right = [T]()
  public init() {}
  
  public var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }
  
  public var count: Int {
    return left.count + right.count
  }
  
  public func peek() -> T? {
    return !left.isEmpty ? left.last : right.first
  }
  
  public mutating func push(_ element: T) -> Bool {
    right.append(element)
    return true
  }
  
  public mutating func pop() -> T? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    
    return left.popLast()
  }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let m = input[1]

var visited = [Bool](repeating: false, count: n + 1)
var graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
var low = 1
var high = 0

for _ in stride(from: 0, to: m, by: 1) {
  let edge = readLine()!.split(separator: " ").map{ Int(String($0))! }
  graph[edge[0]].append((edge[1], edge[2]))
  graph[edge[1]].append((edge[0], edge[2]))
  
  if edge[2] > high {
    high = edge[2]
  }
}

let ab = readLine()!.split(separator: " ").map { Int(String($0))! }

let start = ab[0]
let end = ab[1]

func resetVisit() {
  for i in stride(from: 1, through: n, by: 1) {
    visited[i] = false
  }
}

func bfs(_ u: Int, _ w: Int) -> Bool {
  
  var q = Queue<Int>()
  q.push(u)

  while !q.isEmpty {
    let now = q.pop()!
    if now == end {
      return true
    }

    for (next, cost) in graph[now] {
      if !visited[next] && cost >= w {
        visited[next] = true
        q.push(next)
      }
    }
  }
  return false
}

var mid = (low + high) / 2

while low <= high {
  var possible = false
  resetVisit()
  
  possible = bfs(start, mid)

  if possible {
    low = mid + 1
  } else {
    high = mid - 1
  }
  mid = (low + high) / 2
}

print(mid)
