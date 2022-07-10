/*
 백준 16927 배열 돌리기 2
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

let n = io.readInt(), m = io.readInt(), r = io.readInt()

var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for i in 0 ..< n {
  for j in 0 ..< m {
    graph[i][j] = io.readInt()
  }
}

var r1 = 0, c1 = 0, r2 = n - 1, c2 = m - 1
var width = m, height = n

while min(width, height) > 1 {
  let round = r % ((width - 1) * 2 + (height - 1) * 2)
  
  if round > 0 {
    var oldArr = [Int]()
    
    for i in 0 ..< width - 1 {
      oldArr.append(graph[r1][c1 + i])
    }
    
    for i in 0 ..< height - 1 {
      oldArr.append(graph[r1 + i][c2])
    }
    
    for i in 0 ..< width - 1 {
      oldArr.append(graph[r2][c2 - i])
    }
    
    for i in 0 ..< height - 1 {
      oldArr.append(graph[r2 - i][c1])
    }
    
    var newArr = Array(oldArr[round...])
    newArr += Array(oldArr[0..<round])
    
    var k = 0
    for i in 0 ..< width - 1 {
      graph[r1][c1 + i] = newArr[k]
      k += 1
    }
    
    for i in 0 ..< height - 1 {
      graph[r1 + i][c2] = newArr[k]
      k += 1
    }
    
    for i in 0 ..< width - 1 {
      graph[r2][c2 - i] = newArr[k]
      k += 1
    }
    
    for i in 0 ..< height - 1 {
      graph[r2 - i][c1] = newArr[k]
      k += 1
    }
  }
  
  
  r1 += 1
  c1 += 1
  r2 -= 1
  c2 -= 1
  width -= 2
  height -= 2
}


let answer = graph.map { $0.map { String($0) }.joined(separator: " ") + "\n" }.joined()

print(answer)

