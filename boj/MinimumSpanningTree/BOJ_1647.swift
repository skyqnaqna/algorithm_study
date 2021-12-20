/*
 백준 1647 도시 분할 계획
 21.12.20
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
let n = io.readInt()
let m = io.readInt()

var parent = [Int](repeating: 0, count: n + 1)
var edges = [(Int, Int, Int)]()

for _ in 0 ..< m {
  let u = io.readInt()
  let v = io.readInt()
  let w = io.readInt()
  edges.append((w, u, v))
}

edges.sort(by: { $0.0 > $1.0 })

for i in 1 ... n {
  parent[i] = i
}

func findParent(_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = findParent(parent[a])
  }
  return parent[a]
}

func unionParent(_ a: Int, _ b: Int) {
  let x = findParent(a)
  let y = findParent(b)
  
  if x < y {
    parent[y] = x
  } else {
    parent[x] = y
  }
}

var answer = 0, cnt = 0

while cnt < n - 2 && !edges.isEmpty {
  let (w, u, v) = edges.removeLast()
  
  if findParent(u) != findParent(v) {
    unionParent(u, v)
    answer += w
    cnt += 1
  }
}

print(answer)
