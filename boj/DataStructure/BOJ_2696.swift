/*
 21.10.06
 백준 2696 중앙값 구하기
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


var t = Int(readLine()!)!
var answer = ""

while t > 0 {
  t -= 1
  
  var maxNumsMinHeap = PriorityQueue<Int>(sort: { $0 < $1 })
  var minNumsMaxHeap = PriorityQueue<Int>(sort: { $0 > $1 })
  
  let n = Int(readLine()!)!
  var arr = [Int]()
  
  for _ in 0 ..< (n / 10) + 1 {
    arr += readLine()!.split(separator: " ").map { Int(String($0))! }
  }
  var res = "\((n + 1) / 2)\n"
  var cnt = 0
  for i in arr.indices {
    if maxNumsMinHeap.count == minNumsMaxHeap.count {
//      maxNumsMinHeap.push(arr[i])
      minNumsMaxHeap.push(arr[i])
    } else {
//      minNumsMaxHeap.push(arr[i])
      maxNumsMinHeap.push(arr[i])
    }
    
    if !minNumsMaxHeap.isEmpty && !maxNumsMinHeap.isEmpty && minNumsMaxHeap.peek()! > maxNumsMinHeap.peek()! {
      maxNumsMinHeap.push(minNumsMaxHeap.pop()!)
      minNumsMaxHeap.push(maxNumsMinHeap.pop()!)
    }
    
    if i % 2 == 0 {
//      res += "\(maxNumsMinHeap.peek()!) "
      res += "\(minNumsMaxHeap.peek()!) "
      cnt += 1
      
      if cnt % 10 == 0 {
        res += "\n"
      }
    }
  }
  answer += res + "\n"
//  print(maxNumsMinHeap)
//  print(minNumsMaxHeap)
}

print(answer)
