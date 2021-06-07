/*
 백준 13549 숨바꼭질 3
 21.06.07
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
let n = input[0], k = input[1]
let INF = Int(1e9)

var dist = [Int](repeating: INF, count: 100001)
var pq = PriorityQueue<(Int, Int)>(sort: { $0.0 < $1.0 })

dist[n] = 0
pq.push((0, n))

while !pq.isEmpty {
  let (cost, now) = pq.pop()!

  if now == k {
    break
  }

  if dist[now] < cost {
    continue
  }

  if 2 * now < 100001 && cost < dist[2 * now]  {
    dist[2 * now] = cost
    pq.push((cost, 2 * now))
  }

  if now + 1 < 100001 && cost + 1 < dist[now + 1] {
    dist[now + 1] = cost + 1
    pq.push((cost + 1, now + 1))
  }

  if now - 1 >= 0 && cost + 1 < dist[now - 1]  {
    dist[now - 1] = cost + 1
    pq.push((cost + 1, now - 1))
  }
}

print(dist[k])
