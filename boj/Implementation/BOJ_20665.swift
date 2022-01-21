/*
 백준 20665 독서실 거리두기
 22.01.21
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
  
  func top() -> T? {
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

//==============================================================================//

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], t = input[1], p = input[2]

var reservation = [(Int, Int)]()
var seat = [Int](repeating: 720, count: n)

func convertTime(_ time: String) -> Int {
  
  let hour = Int(time[time.startIndex..<time.index(time.startIndex, offsetBy: 2)])!
  let minute = Int(time[time.index(time.startIndex, offsetBy: 2)..<time.endIndex])!
  
  return hour * 60 + minute
}

for _ in 0 ..< t {
  let info = readLine()!.split(separator: " ").map { String($0) }
  reservation.append((convertTime(info[0]), convertTime(info[1])))
}

reservation.sort(by: {
  if $0.0 == $1.0 {
    return $0.1 < $1.1
  } else {
    return $0.0 < $1.0
  }
})

var usingList = PriorityQueue<(Int, Int, Int)>(sort: { $0.1 < $1.1 })
var used = [Bool](repeating: false, count: n)

for (start, end) in reservation {
  while !usingList.isEmpty && usingList.top()!.1 <= start {
    let (_, _, idx) = usingList.pop()!
    used[idx] = false
  }
  
  if usingList.isEmpty {
    usingList.push((start, end, 0))
    seat[0] -= end - start
    used[0] = true
    continue
  }
  
  var seatNum = [Int]()
  for i in 0 ..< n {
    if used[i] {
      seatNum.append(i)
    }
  }
  
  var maxDist = -1, num = -1
  
  for i in 0 ..< seatNum.count - 1 {
    var dist = seatNum[i + 1] - seatNum[i] - 1
    if dist % 2 == 0 {
      dist = dist / 2 - 1
    } else {
      dist /= 2
    }
    
    if maxDist < dist {
      maxDist = dist
      num = (seatNum[i] + seatNum[i + 1]) / 2
    }
  }
  
  if !used[0] && maxDist <= seatNum.first! - 1 {
    maxDist = seatNum.first! - 1
    num = 0
  }
  
  if !used[n - 1] && maxDist < n - 1 - seatNum.last! - 1 {
    num = n - 1
  }
  
  used[num] = true
  usingList.push((start, end, num))
  seat[num] -= end - start
}

print(seat[p - 1])
