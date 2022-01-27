/*
 백준 2042 구간 합 구하기
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

let MAX = 4000001
var tree = [Int](repeating: 0, count: MAX)

let io = FileIO()
let n = io.readInt(), m = io.readInt(), k = io.readInt()

var arr = [Int](repeating: 0, count: n)

for i in 0 ..< n {
  arr[i] = io.readInt()
}

func initTree(_ node: Int, _ start: Int, _ end: Int) -> Int {
  if start == end {
    tree[node] = arr[start]
  } else {
    let mid = (start + end) / 2
    tree[node] = initTree(node * 2, start, mid) + initTree(node * 2 + 1, mid + 1, end)
  }
  
  return tree[node]
}

func updateTree(_ node: Int, _ start: Int, _ end: Int, _ idx: Int, _ diff: Int) {
  if idx < start || idx > end { return }
  
  tree[node] += diff
  
  if start != end {
    let mid = (start + end) / 2
    updateTree(node * 2, start, mid, idx, diff)
    updateTree(node * 2 + 1, mid + 1, end, idx, diff)
  }
}

func queryTree(_ node: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) -> Int {
  if start > right || end < left { return 0 }
  if left <= start && end <= right { return tree[node] }
  
  let mid = (start + end) / 2
  return queryTree(node * 2, start, mid, left, right) + queryTree(node * 2 + 1, mid + 1, end, left, right)
}

_ = initTree(1, 0, n - 1)

var answer = ""

for _ in 0 ..< m + k {
  let a = io.readInt(), b = io.readInt(), c = io.readInt()
  
  if a == 1 {
    let diff = c - arr[b - 1]
    arr[b - 1] = c
    updateTree(1, 0, n - 1, b - 1, diff)
  } else {
    answer += "\(queryTree(1, 0, n - 1, b - 1, c - 1))\n"
  }
}

print(answer)
