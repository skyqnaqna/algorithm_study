// 프로그래머스 무지의 먹방 라이브
// 21.04.27

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

func solution(_ food_times:[Int], _ k:Int64) -> Int {
  var n = Int64(food_times.count)
  let total = food_times.reduce(0, +)

  if total <= k {
    return -1
  } else {
    var pre: Int64 = 0
    var time = k
    var foods = PriorityQueue<(Int64, Int)>(sort: { $0.0 < $1.0 })
    
    for i in 0..<food_times.count {
      foods.push((Int64(food_times[i]), i + 1))
    }

    var now = foods.peek()!
    
    while time > ((now.0 - pre) * n) {
      time -= (now.0 - pre) * n
      n -= 1
      pre = now.0
      foods.pop()
      now = foods.peek()!
    }
    
    var result = [(Int64, Int)]()
    
    while !foods.isEmpty {
      result.append(foods.pop()!)
    }
    
    result.sort(by: { $0.1 < $1.1 })

    return result[Int(time % n)].1
  }
}

print(solution([3, 1, 2], 5))
print(solution([4,2,3,6,7,1,5,8], 16))
