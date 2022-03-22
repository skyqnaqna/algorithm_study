/*
 백준 14267 회사 문화 1
 22.03.22
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

var tree = [[Int]](repeating: [Int](), count: n + 1)
var praise = [Int](repeating: 0, count: n + 1)

for i in 1 ... n {
  let p = io.readInt()
  
  if p > 0 {
    tree[p].append(i)
  }
}

for _ in 0 ..< m {
  let i = io.readInt(), w = io.readInt()
  
  praise[i] += w
}

func dfs(_ cur: Int) {
  for next in tree[cur] {
    praise[next] += praise[cur]
    dfs(next)
  }
}

dfs(1)

var answer = ""
for i in 1 ... n {
  answer += "\(praise[i]) "
}

print(answer)
