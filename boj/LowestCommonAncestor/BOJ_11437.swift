/*
 백준 11437 LCA
 22.02.21
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
let MAX = 50001
let n = io.readInt()

var graph = [[Int]](repeating: [Int](), count: MAX)
var depth = [Int](repeating: -1, count: MAX)
var parent = [[Int]](repeating: [Int](repeating: -1, count: 17), count: MAX)

func bfs() {
  var q = [(Int, Int)](), front = 0
  
  depth[1] = 0
  q.append((1, 0))
  
  while front < q.count {
    let (now, dist) = q[front]
    front += 1
    
    for next in graph[now] {
      if depth[next] == -1 {
        depth[next] = dist + 1
        parent[next][0] = now
        q.append((next, dist + 1))
      }
    }
  }
}

for _ in 0 ..< n - 1 {
  let u = io.readInt(), v = io.readInt()
  graph[u].append(v)
  graph[v].append(u)
}

bfs()

for j in 0 ..< 16 {
  for i in 1 ... n {
    if parent[i][j] != -1 {
      parent[i][j + 1] = parent[parent[i][j]][j]
    }
  }
}

let m = io.readInt()
var answer = ""

for _ in 0 ..< m {
  var u = io.readInt(), v = io.readInt()
  
  if depth[u] < depth[v] { swap(&u, &v) }
  var diff = depth[u] - depth[v]
  
  var i = 0
  while diff > 0 {
    if diff % 2 == 1 {
      u = parent[u][i]
    }
    
    i += 1
    diff /= 2
  }
  
  if u != v {
    for j in stride(from: 16, through: 0, by: -1) {
      if parent[u][j] != -1 && parent[u][j] != parent[v][j] {
        u = parent[u][j]
        v = parent[v][j]
      }
    }
    u = parent[u][0]
  }
  
  answer += "\(u)\n"
}

print(answer)
