// 썸머코딩 2

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

func solution(_ t:[Int], _ r:[Int]) -> [Int] {
  var result = [Int]()
  var arr = [(Int, Int, Int)]()

  for i in stride(from: 0, to: t.count, by: 1) {
    arr.append((r[i], t[i], i))
  }

  arr.sort(by: { $0.1 > $1.1 })

  var lift = 0
  // 등급, time, id
  var ratingOrdered = PriorityQueue<(Int, Int, Int)>(sort: {
    if $0.0 == $1.0 {
      if $0.1 == $1.1 {
        return $0.2 < $1.2
      } else {
        return $0.1 < $1.1
      }
    } else {
      return $0.0 < $1.0
    }
  })

  while true {
    if arr.isEmpty && ratingOrdered.isEmpty { break }

    while !arr.isEmpty && arr.last!.1 <= lift {
      ratingOrdered.push((arr.last!.0, arr.last!.1, arr.last!.2))
      arr.removeLast()
    }

    if !ratingOrdered.isEmpty {
      result.append(ratingOrdered.pop()!.2)
    }

    lift += 1
  }

  return result
}

print(solution([0,1,3,0], [0,1,2,3]))
print(solution([7,6,8,1], [0,1,2,3]))
print(solution([0,1,2,3], [0,0,0,0]))
print(solution([3,2,1,0], [0,0,0,0]))
print(solution([0,1,2,3,2,1,0],[1,1,1,0,1,1,1]))