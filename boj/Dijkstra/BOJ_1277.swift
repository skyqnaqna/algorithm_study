/*
 백준 1277 발전소 설치
 21.06.18
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct PriorityQueue<T> {
  var array = [T]()
  let sort: (T, T) -> Bool

  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }

  var isEmpty: Bool {
    return array.isEmpty
  }

  var count: Int {
    return array.count
  }

  func peek() -> T? {
    return array.first
  }

  func leftChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 1
  }

  func rightChildIndex(ofParentAt index: Int) -> Int {
    return (2 * index) + 2
  }

  func parentIndex(ofChildAt index: Int) -> Int {
    return (index - 1) / 2
  }

  // MARK:- remove operation
  mutating func pop() -> T? {
    guard !isEmpty else {
      return nil
    }

    array.swapAt(0, count - 1)
    defer {
      siftDown(from: 0)
    }
    return array.removeLast()
  }

  mutating func siftDown(from index: Int) {
    var parent = index
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      var candidate = parent

      if left < count && sort(array[left], array[candidate]) {
        candidate = left
      }
      if right < count && sort(array[right], array[candidate]) {
        candidate = right
      }
      if candidate == parent {
        return
      }
      array.swapAt(parent, candidate)
      parent = candidate
    }
  }

  // MARK:- insert operation
  mutating func push(_ element: T) {
    array.append(element)
    siftUp(from: array.count - 1)
  }

  mutating func siftUp(from index: Int) {
    var child = index
    var parent = parentIndex(ofChildAt: child)
    while child > 0 && sort(array[child], array[parent]) {
      array.swapAt(child, parent)
      child = parent
      parent = parentIndex(ofChildAt: child)
    }
  }
}

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], w = input[1]
let m = Double(readLine()!)!
let INF = Double(1e9)

var plants = [(Double, Double)]()
var distance = [Double](repeating: INF, count: n)
var parents = [Int](repeating: 0, count: n) // 연결된 발전소 중 가장 작은 번호 저장

for i in 0..<n {
  let xy = readLine()!.split(separator: " ").map{ Double(String($0))! }

  plants.append((xy[0], xy[1]))
  parents[i] = i
}

for _ in 0..<w {
  let i = readLine()!.split(separator: " ").map{ Int(String($0))! }

  _union(i[0] - 1, i[1] - 1) // 1번부터니까 1뺌
}

func getDistance(_ pos1: Int, _ pos2: Int) -> Double {
  let (row1, col1) = plants[pos1]
  let (row2, col2) = plants[pos2]

  return sqrt(pow(row1 - row2, 2) + pow(col1 - col2, 2))
}

func getParent(_ idx: Int) -> Int {
  if parents[idx] != idx {
    parents[idx] = getParent(parents[idx])
  }
  return parents[idx]
}

func _union(_ idx1: Int, _ idx2: Int) {
  let x = getParent(idx1)
  let y = getParent(idx2)

  if x < y { parents[y] = x }
  else { parents[x] = y }
}

var pq = PriorityQueue<(Int, Double)>(sort: { $0.1 < $1.1 })

distance[0] = 0
pq.push((0, 0))

// 이미 연결되어 있는 곳은 거리 0으로 저장
for i in 1..<n {
  if getParent(i) == 0 {
    distance[i] = 0
    pq.push((i, 0))
  }
}

while !pq.isEmpty {
  let (now, dist) = pq.pop()!

  if dist > distance[now] {
    continue
  }

  for next in 0..<n {
    if now == next {
      continue
    }

    if dist < distance[next] && getParent(now) == getParent(next) {
      distance[next] = dist
      pq.push((next, dist))
    } else {
      let cost = getDistance(now, next)
      if cost > m {
        continue
      }

      if cost + dist < distance[next] {
        distance[next] = cost + dist
        pq.push((next, distance[next]))
      }
    }
  }
}

if distance[n - 1] < INF {
  print(Int(distance[n - 1] * 1000))
} else {
  print(-1)
}
