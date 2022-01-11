/*
 백준 2108 통계학
 22.01.12
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

var arr = [Int]()
var dict = [Int: Int]()

for _ in 0 ..< n {
  let x = io.readInt()
  
  arr.append(x)
  dict[x, default: 0] += 1
}

arr.sort()
let sum = arr.reduce(0, +)
print(lround(Double(sum) / Double(n)))
print(arr[n / 2])
if dict.count > 1 {
  let dict2arr = Array(dict).sorted(by: { if $0.value == $1.value {
    return $0.key > $1.key
  } else {
    return $0.value < $1.value
  }})
  if dict2arr.last!.value == dict2arr[dict.count - 2].value {
    print(dict2arr[dict.count - 2].key)
  } else {
    print(dict2arr.last!.key)
  }
} else {
  print(arr[0])
}
print(arr.max()! - arr.min()!)
