/*
 백준 17396 백도어
 23.01.19
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

struct Heap {
  private var arr = [(Int, Int64)]()
  private var size = 0

  var isEmpty: Bool { return size == 0 }

  mutating func heapPush(_ node: Int, _ cost: Int64) {
    arr.append((node, cost))
    var cur = size

    while cur > 0 && arr[cur].1 < arr[(cur - 1) / 2].1 {
      let temp = arr[(cur - 1) / 2]
      arr[(cur - 1) / 2] = arr[cur]
      arr[cur] = temp
      cur = (cur - 1) / 2
    }

    size += 1
  }

  mutating func heapPop() -> (Int, Int64) {
    let res = arr[0]
    size -= 1
    arr[0] = arr[size]
    arr.removeLast()

    var cur = 0

    while cur * 2 + 1 < size {
      var child = 0, left = cur * 2 + 1, right = cur * 2 + 2

      if right == size {
        child = left
      } else {
        child = arr[left].1 < arr[right].1 ? left : right
      }

      if arr[cur].1 < arr[child].1 { break }

      let temp = arr[child]
      arr[child] = arr[cur]
      arr[cur] = temp
      cur = child
    }

    return res
  }
}

let io = FileIO()

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = input[0], m = input[1]
let n = io.readInt(), m = io.readInt()

//let isVisible = readLine()!.split(separator: " ").map { Int(String($0))! }
var isVisible = [Int]()

for _ in 0 ..< n { isVisible.append(io.readInt()) }

var dist = [Int64](repeating: -1, count: n)

var edges = [[(Int, Int64)]](repeating: [(Int, Int64)](), count: n)

for _ in 0 ..< m {
//  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
//  edges[e[0]].append((e[1], Int64(e[2])))
//  edges[e[1]].append((e[0], Int64(e[2])))

  let a = io.readInt(), b = io.readInt(), t = Int64(io.readInt())
  edges[a].append((b, t))
  edges[b].append((a, t))
}

var pq = Heap()
dist[0] = 0
pq.heapPush(0, 0)

while !pq.isEmpty {
  let (now, cost) = pq.heapPop()

  if dist[now] < cost { continue }

  for (next, weight) in edges[now] {
    if next != n - 1 && isVisible[next] == 1 { continue }
    if dist[next] == -1 || cost + weight < dist[next] {
      dist[next] = cost + weight
      pq.heapPush(next, dist[next])
    }
  }
}

print(dist[n - 1])
