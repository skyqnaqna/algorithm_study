/*
 백준 7662 이중 우선순위 큐
 22.07.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

final class FileIO {
  private var buffer:[UInt8]
  private var index: Int
  
  init(fileHandle: FileHandle = FileHandle.standardInput) {
    buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    index = 0
  }
  
  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }
    
    return buffer.withUnsafeBufferPointer { $0[index] }
  }
  
  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }
    
    return sum * (isPositive ? 1:-1)
  }
  
  @inline(__always) func readString() -> String {
    var str = ""
    var now = read()
    
    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    while now != 10
            && now != 32 && now != 0 {
      str += String(bytes: [now], encoding: .ascii)!
      now = read()
    }
    
    return str
  }
}

struct Heap<T> {
  var arr = [T]()
  var size: Int { return arr.count }
  var isEmpty: Bool { return arr.isEmpty }
  var top: T? { return arr.first ?? nil }
  let sort: (T, T) -> Bool
  
  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }
  
  mutating func clear() { arr.removeAll() }
  
  mutating func push(_ num: T) {
    arr.append(num)
    var cur = size - 1
    
    while cur > 0 && sort(arr[cur], arr[(cur - 1) / 2]) {
      let temp = arr[(cur - 1) / 2]
      arr[(cur - 1) / 2] = arr[cur]
      arr[cur] = temp
      cur = (cur - 1) / 2
    }
  }
  
  mutating func pop() -> T {
    let res = arr[0]
    arr.swapAt(0, size - 1)
    arr.removeLast()
    var cur = 0
    
    while cur * 2 + 1 < size {
      var child = 0, left = cur * 2 + 1, right = cur * 2 + 2
      
      if right == size {
        child = left
      } else {
        child = sort(arr[left], arr[right]) ? left : right
      }
      
      if sort(arr[cur], arr[child]) { break }
      
      let temp = arr[child]
      arr[child] = arr[cur]
      arr[cur] = temp
      cur = child
    }
    
    return res
  }
}

let io = FileIO()
let t = io.readInt()

var answer = ""
var maxHeap = Heap<Int>(sort: >), minHeap = Heap<Int>(sort: <)
var numCounter = [Int: Int]()

func removeInvalidNum(_ target: Int) {
  while !maxHeap.isEmpty &&
          (numCounter[maxHeap.top!] == nil || numCounter[maxHeap.top!]! == 0)
  {
    _ = maxHeap.pop()
  }
  
  while !minHeap.isEmpty &&
          (numCounter[minHeap.top!] == nil || numCounter[minHeap.top!]! == 0)
  {
    _ = minHeap.pop()
  }
}

for _ in 0 ..< t {
  let k = io.readInt()
  
  maxHeap.clear()
  minHeap.clear()
  numCounter.removeAll()
  
  for _ in 0 ..< k {
    let op = io.readString()
    
    if op == "I" {
      let num = io.readInt()
      
      maxHeap.push(num)
      minHeap.push(num)
      numCounter[num, default: 0] += 1
    } else {
      let op2 = io.readInt()
      
      if op2 == 1 {
        guard !maxHeap.isEmpty else { continue }
        
        let res = maxHeap.pop()
        numCounter[res]! -= 1
        removeInvalidNum(res)
        
      } else {
        guard !minHeap.isEmpty else { continue }
        
        let res = minHeap.pop()
        numCounter[res]! -= 1
        removeInvalidNum(res)
      }
    }
    
  }
  if maxHeap.isEmpty { answer += "EMPTY\n" }
  else { answer += "\(maxHeap.top!) \(minHeap.top!)\n" }
}

print(answer)
