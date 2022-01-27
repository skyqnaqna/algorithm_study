/*
 백준 2243 사탕상자
 22.01.28
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

let MAX = 1000000
var tree = [Int](repeating: 0, count: MAX * 4)

let io = FileIO()
let n = io.readInt()

func updateTree(_ node: Int, _ start: Int, _ end: Int, _ idx: Int, _ diff: Int) {
  if idx < start || idx > end { return }
  
  tree[node] += diff
  
  if start != end {
    let mid = (start + end) / 2
    updateTree(node * 2, start, mid, idx, diff)
    updateTree(node * 2 + 1, mid + 1, end, idx, diff)
  }
}

func queryTree(_ node: Int, _ start: Int, _ end: Int, _ target: Int) -> Int {
  if start == end { return start }
  
  let mid = (start + end) / 2
  
  if tree[node * 2] >= target {
    return queryTree(node * 2, start, mid, target)
  } else {
    return queryTree(node * 2 + 1, mid + 1, end, target - tree[node * 2])
  }
}

var answer = ""

for _ in 0 ..< n {
  let a = io.readInt(), b = io.readInt()
  
  if a == 1 {
    let pos = queryTree(1, 1, MAX, b)
    answer += "\(pos)\n"
    updateTree(1, 1, MAX, pos, -1)
  } else {
    let c = io.readInt()
    updateTree(1, 1, MAX, b, c)
  }
}

print(answer)
