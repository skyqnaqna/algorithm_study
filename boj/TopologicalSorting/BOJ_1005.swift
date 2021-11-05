/*
 백준 1005 ACM Craft
 21.11.05
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
let t = io.readInt()
var answer = ""

func solution() -> String {
  let n = io.readInt()
  let k = io.readInt()
  
  let times = (0..<n).reduce(into: [Int]()) { arr, _ in arr.append(io.readInt()) }
  
  var indegree = [Int](repeating: 0, count: n)
  var result = [Int](repeating: 0, count: n)
  var edges = [[Int]](repeating: [Int](), count: n)
  
  for _ in 0 ..< k {
    let x = io.readInt() - 1
    let y = io.readInt() - 1
    
    edges[x].append(y)
    indegree[y] += 1
  }
  
  let w = io.readInt() - 1
  
  var q = [Int](), front = 0
  
  for i in 0 ..< n {
    if indegree[i] == 0 {
      q.append(i)
      result[i] = times[i]
    }
  }
  
  while front < q.count {
    let now = q[front]
    front += 1
    
    for next in edges[now] {
      if result[now] + times[next] > result[next] {
        result[next] = result[now] + times[next]
      }
      
      indegree[next] -= 1
      
      if indegree[next] == 0 {
        q.append(next)
      }
    }
  }
  
  return "\(result[w])\n"
}

for _ in 0 ..< t {
  answer += solution()
}

print(answer)
