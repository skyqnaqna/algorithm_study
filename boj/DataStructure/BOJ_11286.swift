/*
 백준 11286 절댓값 힙
 22.02.27
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

let io = FileIO()

var heap = [Int](repeating: 0, count: 100000), heapSize = 0

func heapPush(_ x: Int) {
  heap[heapSize] = x
  var cur = heapSize
  
  while cur > 0 && abs(heap[cur]) <= abs(heap[(cur - 1) / 2]) {
    if abs(heap[cur]) == abs(heap[(cur - 1) / 2]) && heap[(cur - 1) / 2] < heap[cur] { break }
    let temp = heap[(cur - 1) / 2]
    heap[(cur - 1) / 2] = heap[cur]
    heap[cur] = temp
    cur = (cur - 1) / 2
  }
  
  heapSize += 1
}

func heapPop() -> Int {
  if heapSize == 0 { return 0 }
  let res = heap[0]
  heapSize -= 1
  heap[0] = heap[heapSize]
  var cur = 0
  
  while cur * 2 + 1 < heapSize {
    var child: Int
    if cur * 2 + 2 == heapSize {
      child = cur * 2 + 1
    } else {
      if abs(heap[cur * 2 + 1]) == abs(heap[cur * 2 + 2]) {
        child = heap[cur * 2 + 1] < heap[cur * 2 + 2] ? cur * 2 + 1 : cur * 2 + 2
      } else {
        child = abs(heap[cur * 2 + 1]) < abs(heap[cur * 2 + 2]) ? cur * 2 + 1 : cur * 2 + 2
      }
    }
    
    if abs(heap[cur]) == abs(heap[child]) && heap[cur] < heap[child] { break }
    if abs(heap[cur]) < abs(heap[child]) { break }
    
    let temp = heap[child]
    heap[child] = heap[cur]
    heap[cur] = temp
    cur = child
  }
  
  return res
}

let n = io.readInt()
var answer = ""

for _ in 0 ..< n {
  let x = io.readInt()
  if x == 0 {
    answer += "\(heapPop())\n"
  } else {
    heapPush(x)
  }
}

print(answer)
