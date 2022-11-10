/*
 백준 14675 단절점과 단절선
 22.11.10
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
let n = io.readInt()

var tree = [[Int]](repeating: [Int](), count: n + 1)

for _ in 1 ..< n {
  let u = io.readInt()
  let v = io.readInt()

  tree[u].append(v)
  tree[v].append(u)
}

let q = io.readInt()
var answer = ""

for _ in 0 ..< q {
  let t = io.readInt()
  let k = io.readInt()

  if t == 1 {
    if n > 2 && tree[k].count > 1 {
      answer += "yes\n"
    } else {
      answer += "no\n"
    }
  } else {
    answer += "yes\n"
  }
}

print(answer)
