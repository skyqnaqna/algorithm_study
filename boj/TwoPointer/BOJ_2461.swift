/*
 백준 2461 대표 선수
 21.12.18
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
let n = input[0], m = input[1]

var arr = [[Int]](repeating: [Int](), count: n)

for i in 0 ..< n {
  arr[i] = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
}

var pos = [Int](repeating: 0, count: n)
var answer = Int(2e9)

var maxHeap = PriorityQueue<(Int, Int)>(sort: {$0.0 > $1.0})
var minHeap = PriorityQueue<(Int, Int)>(sort: {$0.0 < $1.0})

for i in 0 ..< n {
  maxHeap.push((arr[i][pos[i]], i))
  minHeap.push((arr[i][pos[i]], i))
}

while true {
  let (maxVal, _) = maxHeap.peek()!
  let (minVal, idx) = minHeap.pop()!
  
  if maxVal - minVal < answer {
    answer = maxVal - minVal
  }
  
  pos[idx] += 1
  
  if pos[idx] == m { break }
  
  minHeap.push((arr[idx][pos[idx]], idx))
  maxHeap.push((arr[idx][pos[idx]], idx))
}

print(answer)
