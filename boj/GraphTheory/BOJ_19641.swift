/*
 백준 19641 중첩 집합 모델
 22.06.24
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

var graph = [Set<Int>](repeating: Set<Int>(), count: n + 1)
var node = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 1)

for _ in 0 ..< n {
  let nodeNum = io.readInt()
  var nextNum = io.readInt()
  while nextNum > -1 {
    graph[nodeNum].insert(nextNum)
    nextNum = io.readInt()
  }
}

let root = io.readInt()

var seq = 0

func travel(_ pre: Int, _ now: Int) {
  seq += 1
  node[now][0] = seq
  
  for next in Array(graph[now]).sorted(by: <) {
    if next == pre { continue }
    
    travel(now, next)
  }
  
  seq += 1
  node[now][1] = seq
}

travel(0, root)

var answer = ""

for i in 1 ... n {
  answer += "\(i) \(node[i][0]) \(node[i][1])\n"
}

print(answer)
