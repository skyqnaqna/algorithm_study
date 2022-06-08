/*
 백준 2539 모자이크
 22.06.08
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

let n = io.readInt(), m = io.readInt()

var target = [(Int, Int)]()
var l = 1, r = max(n, m) + 1

let k = io.readInt(), cnt = io.readInt()

for _ in 0 ..< cnt {
  let row = io.readInt(), col = io.readInt()
  target.append((row, col))
  
  if l < row {
    l = row
  }
}

target.sort(by: { $0.1 > $1.1 })

func getCnt(_ size: Int) -> Int {
  var res = 0
  var temp = target
  
  while !temp.isEmpty {
    let (r, c) = temp.removeLast()
    
    if r > size { return 101 }
    
    while !temp.isEmpty && temp.last!.0 <= size && temp.last!.1 < c + size {
      temp.removeLast()
    }
    
    res += 1
  }
  
  return temp.isEmpty ? res : 101
}

var answer = 0

while l <= r {
  let mid = (l + r) / 2
  let res = getCnt(mid)
  
  if res <= k {
    r = mid - 1
    answer = mid
  } else {
    l = mid + 1
  }
}

print(answer)
