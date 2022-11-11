/*
 백준 6497 전력난
 22.11.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

// FileIO 출처: https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88#file-fileio-swift-L6
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

func solution() {
  var parent = [Int](repeating: 0, count: 200000)

  func getParent(_ u: Int) -> Int {
    if parent[u] != u {
      parent[u] = getParent(parent[u])
    }

    return parent[u]
  }

  func unionParent(_ u: Int, _ v: Int) {
    let x = getParent(u)
    let y = getParent(v)

    if x < y {
      parent[y] = x
    } else {
      parent[x] = y
    }
  }

  var answer = ""

  while true {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

//    let m = input[0], n = input[1]
    let m = io.readInt()
    let n = io.readInt()

    if m == 0 && n == 0 {
      print(answer)
      return
    }

    var edges = [(Int, Int, Int)]()
    var total = 0

    for _ in 0 ..< n {
//      let i = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//      let x = i[0], y = i[1], z = i[2]
      let x = io.readInt()
      let y = io.readInt()
      let z = io.readInt()

      edges.append((x, y, z))
      total += z
    }

    for i in 0 ..< m { parent[i] = i }

    var cnt = 0, weight = 0
    edges.sort(by: { $0.2 > $1.2 })

    while cnt < m - 1 {
      let (x, y, z) = edges.removeLast()

      if getParent(x) != getParent(y) {
        unionParent(x, y)
        weight += z
        cnt += 1
      }
    }

    answer += "\(total - weight)\n"
  }
}

solution()
