/*
 백준 3015 오아시스 재결합
 22.07.09
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

var stack = [(Int, Int)](), answer = 0

for _ in 0 ..< n {
  let now = io.readInt()
  
  var cnt = 1
  
  while !stack.isEmpty && stack.last!.0 <= now {
    if stack.last!.0 == now {
      cnt = stack.last!.1 + 1
    } else {
      cnt = 1
    }
    
    answer += stack.last!.1
    stack.removeLast()
  }
  
  if !stack.isEmpty {
    answer += 1
  }
  
  stack.append((now, cnt))
}

print(answer)
