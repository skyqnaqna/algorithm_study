/*
 21.10.08
 백준 19598 최소 회의실 개수
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

let n = Int(readLine()!)!

var times = [(Int, Int)]()

for _ in 0 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  times.append((input[0], input[1]))
}

times.sort(by: < )

var endTimes = PriorityQueue<Int>(sort: <)

endTimes.push(times[0].1)

for i in 1 ..< times.count {
  if endTimes.peek()! <= times[i].0 {
    endTimes.pop()
  }
  endTimes.push(times[i].1)
}

print(endTimes.count)
