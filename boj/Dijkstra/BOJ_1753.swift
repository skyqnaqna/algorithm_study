/*
 백준 1753 최단경로
 21.06.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct PriorityQueue<T> {
  var array = [T]()
  let sort: (T, T) -> Bool

  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }

  var isEmpty: Bool {
    return array.isEmpty
  }

  var count: Int {
    return array.count
  }

  func peek() -> T? {
    return array.first
  }

  func leftChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 1
  }

  func rightChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 2
  }

  func parentIndex(ofChildAt index: Int) -> Int {
    return (index - 1) / 2
  }

  // MARK:- remove operation
  mutating func pop() -> T? {
    guard !isEmpty else {
      return nil
    }

    array.swapAt(0, count - 1)
    defer {
      siftDown(from: 0)
    }
    return array.removeLast()
  }

  mutating func siftDown(from index: Int) {
    var parent = index
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      var candidate = parent

      if left < count && sort(array[left], array[candidate]) {
        candidate = left
      }
      if right < count && sort(array[right], array[candidate]) {
        candidate = right
      }
      if candidate == parent {
        return
      }
      array.swapAt(parent, candidate)
      parent = candidate
    }
  }

  // MARK:- insert operation
  mutating func push(_ element: T) {
    array.append(element)
    siftUp(from: array.count - 1)
  }

  mutating func siftUp(from index: Int) {
    var child = index
    var parent = parentIndex(ofChildAt: child)
    while child > 0 && sort(array[child], array[parent]) {
      array.swapAt(child, parent)
      child = parent
      parent = parentIndex(ofChildAt: child)
    }
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)!
let v = input[0], e = input[1]
let INF = Int(1e9)

var edges = [[(Int, Int)]](repeating: [(Int, Int)](), count: v + 1)

for _ in 0..<e {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  edges[i[0]].append((i[1], i[2]))
}

var dist = [Int](repeating: INF, count: v + 1)
var pq = PriorityQueue<(Int, Int)>(sort: { $0.1 < $1.1 })

dist[k] = 0
pq.push((k, 0))

while !pq.isEmpty {
  let (now, cost) = pq.pop()!

  if cost > dist[now] {
    continue
  }

  for (next, w) in edges[now] {
    if dist[now] + w <= dist[next] {
      dist[next] = dist[now] + w
      pq.push((next, dist[next]))
    }
  }
}

for i in 1...v {
  if dist[i] < INF {
    print(dist[i])
  } else {
    print("INF")
  }
}
