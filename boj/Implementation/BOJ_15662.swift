/*
 백준 15662 톱니바퀴 (2)
 22.07.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Deque<T> {
  var left = [T]()
  var right = [T]()
  var count: Int { return left.count + right.count }
  var isEmpty: Bool { return left.isEmpty && right.isEmpty }
  
  var front: T {
    if left.isEmpty {
      return right.first!
    }
    return left.last!
  }
  
  var back: T {
    if right.isEmpty {
      return left.first!
    }
    
    return right.last!
  }
  
  init(_ arr: [T]) {
    self.right = arr
  }
  
  mutating func pushLast(_ item: T) {
    right.append(item)
  }
  
  mutating func pushFront(_ item: T) {
    left.append(item)
  }
  
  mutating func popLast() -> T {
    if right.isEmpty {
      right = left.reversed()
      left.removeAll()
    }
    
    return right.removeLast()
  }
  
  mutating func popFront() -> T {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    
    return left.removeLast()
  }
  
  func find(at idx: Int) -> T? {
    let arr = left.reversed() + right
    for i in arr.indices {
      if i == idx { return arr[i] }
    }
    
    return nil
  }
  
}

let t = Int(readLine()!)!

var gears = [Deque<Int>]()

for _ in 0 ..< t {
  let input = readLine()!.map { Int(String($0))! }
  
  gears.append(Deque<Int>(input))
}

let k = Int(readLine()!)!

func rotateGear(_ gear: Int, _ dir: Int) {
  if dir == -1 {
    let first = gears[gear].popFront()
    gears[gear].pushLast(first)
  } else {
    let last = gears[gear].popLast()
    gears[gear].pushFront(last)
  }
}

for _ in 0 ..< k {
  let op = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  var rotateInfo = [(Int, Int)]()
  var isChecked = [Bool](repeating: false, count: t)
  var front = 0
  
  rotateInfo.append((op[0] - 1, op[1]))
  isChecked[op[0] - 1] = true
  
  while front < rotateInfo.count {
    let (now, dir) = rotateInfo[front]
    front += 1
    
    let left = now - 1, right = now + 1
    
    if 0 <= left && !isChecked[left] {
      if gears[left].find(at: 2)! != gears[now].find(at: 6)! {
        rotateInfo.append((left, dir * -1))
        isChecked[left] = true
      }
    }
    
    if right < t && !isChecked[right] {
      if gears[right].find(at: 6)! != gears[now].find(at: 2)! {
        rotateInfo.append((right, dir * -1))
        isChecked[right] = true
      }
    }
  }
  
  for (gear, dir) in rotateInfo {
    rotateGear(gear, dir)
  }
}

var answer = 0

for i in 0 ..< t {
  if gears[i].front == 1 { answer += 1 }
}

print(answer)
