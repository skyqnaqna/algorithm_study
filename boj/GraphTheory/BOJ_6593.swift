/*
 백준 6593 상범 빌딩
 22.11.28
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

final class FileIO {
  private let buffer:[UInt8]
  private var index: Int = 0

  init(fileHandle: FileHandle = FileHandle.standardInput) {

    buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
  }

  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }

    return buffer[index]
  }

  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true

    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }

    return sum * (isPositive ? 1:-1)
  }

  @inline(__always) func readString() -> String {
    var now = read()

    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    let beginIndex = index-1

    while now != 10,
          now != 32,
          now != 0 { now = read() }

    return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
  }

  @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
    var now = read()

    while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
    let beginIndex = index-1

    while now != 10,
          now != 32,
          now != 0 { now = read() }

    return Array(buffer[beginIndex..<(index-1)])
  }
}

let io = FileIO()
let direction = [(0, -1, 0), (0, 0, 1), (0, 1, 0), (0, 0, -1), (-1, 0, 0), (1, 0, 0)]
var answer = ""

while true {
  let l = io.readInt(), r = io.readInt(), c = io.readInt()

  func inBound(_ _l: Int, _ _r: Int, _ _c: Int) -> Bool {
    return 0 <= _l && _l < l && 0 <= _r && _r < r && 0 <= _c && _c < c
  }

  if l == 0 && r == 0 && c == 0 { break }

  var graph = [[[Character]]]()
  var dist = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: c), count: r), count: l)
  var s = (0, 0, 0), e = (0, 0, 0)

  for i in 0 ..< l {
    var arr2d = [[Character]]()

    for j in 0 ..< r {
      let arr = io.readString().map { $0 }

      for k in arr.indices {
        if arr[k] == "S" {
          s = (i, j, k)
        } else if arr[k] == "E" {
          e = (i, j, k)
        }
      }

      arr2d.append(arr)
    }

    graph.append(arr2d)
  }


  var q = [(Int, Int, Int)](), front = 0

  q.append(s)
  dist[s.0][s.1][s.2] = 0

  while front < q.count {
    let now = q[front]
    front += 1

    if now == e { break }

    for (dz, dy, dx) in direction {
      let nl = now.0 + dz
      let nr = now.1 + dy
      let nc = now.2 + dx

      if !inBound(nl, nr, nc) || graph[nl][nr][nc] == "#" || dist[nl][nr][nc] != -1 { continue }

      q.append((nl, nr, nc))
      dist[nl][nr][nc] = dist[now.0][now.1][now.2] + 1
    }
  }

  if dist[e.0][e.1][e.2] == -1 {
    answer += "Trapped!\n"
  } else {
    answer += "Escaped in \(dist[e.0][e.1][e.2]) minute(s).\n"
  }
}

print(answer)
