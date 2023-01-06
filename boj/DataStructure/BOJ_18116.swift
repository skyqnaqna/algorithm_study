/*
 백준 18116 로봇 조립
 23.01.06
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

let n = io.readInt()

var parent = [Int](repeating: 0, count: Int(1e6) + 1)
var cnt = [Int](repeating: 1, count: Int(1e6) + 1)

func getParent(_ num: Int) -> Int {
  if parent[num] == 0 {
    parent[num] = num
    return num
  } else if parent[num] != num {
    parent[num] = getParent(parent[num])
  }

  return parent[num]
}

func unionParent(_ a: Int, _ b: Int) {
  let x = getParent(a)
  let y = getParent(b)

  if x < y {
    parent[y] = x
    cnt[x] += cnt[y]
  } else {
    parent[x] = y
    cnt[y] += cnt[x]
  }
}

var answer =  ""

for _ in 0 ..< n {
  let q = io.readString()

  if q == "I" {
    let a = io.readInt()
    let b = io.readInt()

    if getParent(a) != getParent(b) {
      unionParent(a, b)
    }
  } else {
    let c = io.readInt()

    answer += "\(cnt[getParent(c)])\n"
  }
}

print(answer)
