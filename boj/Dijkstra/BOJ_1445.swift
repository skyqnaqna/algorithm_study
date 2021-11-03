/*
 백준 1445 일요일 아침의 데이트
 21.11.03
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

let INF = Int(1e9)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var start = (0, 0), end = (0, 0)
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

// (쓰레기 통과, 쓰레기 인접)
var dist = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (INF, INF), count: m), count: n)

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

// 주변에 쓰레기가 있으면 true
func checkAround(_ r: Int, _ c: Int) -> Bool {
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if !inBound(nr, nc) { continue }
    
    if graph[nr][nc] == -1 {
      return true
    }
  }
  return false
}

for i in 0 ..< n {
  let row = readLine()!.map { String($0) }
  
  for j in 0 ..< m {
    if row[j] == "S" {
      start = (i, j)
    } else if row[j] == "F" {
      end = (i, j)
    } else if row[j] == "g" {
      graph[i][j] = -1
    }
  }
}

graph[start.0][start.1] = 0
graph[end.0][end.1] = 0
dist[start.0][start.1] = (0, 0)

var pq = PriorityQueue<(Int, Int, (Int, Int))>(sort: {
  if $0.0 == $1.0 {
    return $0.1 < $1.1
  }
  return $0.0 < $1.0
})

pq.push((0, 0, start))

var answer = [(Int, Int)]()

while !pq.isEmpty {
  let (pathCnt, sideCnt, (r, c)) = pq.pop()!
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if !inBound(nr, nc) { continue }
    
    if (nr, nc) == end {
      answer.append((pathCnt, sideCnt))
      continue
    }
    
    // 다음 지점이 쓰레기가 있는지 없는지에 따라
    // 통과한 쓰레기가 더 적은 곳이거나 쓰레기 옆을 지나온 칸의 개수가 더 적으면 Push
    if graph[nr][nc] == -1 {
      if pathCnt + 1 < dist[nr][nc].0 ||
          (pathCnt + 1 == dist[nr][nc].0 && sideCnt < dist[nr][nc].1) {
        pq.push((pathCnt + 1, sideCnt, (nr, nc)))
        dist[nr][nc] = (pathCnt + 1, sideCnt)
      }
    } else {
      let trash = checkAround(nr, nc) ? 1 : 0
      
      if pathCnt < dist[nr][nc].0 ||
          (pathCnt == dist[nr][nc].0 && sideCnt + trash < dist[nr][nc].1) {
        pq.push((pathCnt, sideCnt + trash, (nr, nc)))
        dist[nr][nc] = (pathCnt, sideCnt + trash)
      }
    }
  }
}

answer.sort(by: <)

print(answer.first!.0, answer.first!.1)
