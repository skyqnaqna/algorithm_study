/*
 백준 21940 가운데에서 만나기
 22.03.10
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

let INF = Int(1e9)
let n = io.readInt(), m = io.readInt()
var dist = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

for _ in 0 ..< m {
  let a = io.readInt(), b = io.readInt(), t = io.readInt()
  
  dist[a - 1][b - 1] = t
}

let k = io.readInt()

var start = [Int]()
for _ in 0 ..< k {
  start.append(io.readInt() - 1)
}

for mid in 0 ..< n {
  for i in 0 ..< n {
    if i == mid { continue }
    for j in 0 ..< n {
      if j == mid || i == j { continue }
      
      if dist[i][mid] + dist[mid][j] < dist[i][j] {
        dist[i][j] = dist[i][mid] + dist[mid][j]
      }
    }
  }
}

var returnDist = [[Int]](repeating: [Int](repeating: -1, count: n), count: k)

for i in 0 ..< k {
  let s = start[i]
  
  for x in 0 ..< n {
    if s == x { returnDist[i][x] = 0 }
    if dist[s][x] == INF || dist[x][s] == INF { continue }
    returnDist[i][x] = dist[s][x] + dist[x][s]
  }
}

var answer = [(Int, Int)]()

for x in 0 ..< n {
  var cnt = 0, maxDist = -1
  for i in 0 ..< k {
    if returnDist[i][x] == -1 { break }
    if returnDist[i][x] > maxDist { maxDist = returnDist[i][x] }
    cnt += 1
  }
  
  if cnt < k { continue }
  
  if answer.isEmpty || maxDist < answer[0].0 {
    answer.removeAll()
    answer.append((maxDist, x))
  } else if maxDist == answer[0].0 {
    answer.append((maxDist, x))
  }
}

answer.sort(by: { $0.1 < $1.1 })

let res = answer.map { String($0.1 + 1) }.joined(separator: " ")

print(res)

