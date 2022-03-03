/*
 백준 11812 K진 트리
 22.03.03
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
let n = io.readInt(), k = io.readInt(), q = io.readInt()

func getDepth(_ target: Int) -> Int {
  if k == 1 { return target }
  
  var l = 0, r = 0, depth = 0
  
  while target < l || r < target {
    l = (l * k) + 1
    r = (r * k) + k
    depth += 1
  }
  
  return depth
}

func lca(_ _u: Int, _ _v: Int) -> Int {
  var res = 0
  var u = _u, v = _v
  var ud = getDepth(u), vd = getDepth(v)
  
  if ud < vd {
    swap(&u , &v)
    swap(&ud, &vd)
  }
  
  let diff = ud - vd
  res = diff
  if (k == 1) { return res }
  
  for _ in 0 ..< diff {
    u = (u - 1) / k
  }
  
  while u != v {
    u = (u - 1) / k
    v = (v - 1) / k
    res += 2
  }
  
  return res
}

var answer = ""

for _ in 0 ..< q {
  let x = io.readInt()
  let y = io.readInt()
  
  answer += "\(lca(x - 1, y - 1))\n"
}

print(answer)
