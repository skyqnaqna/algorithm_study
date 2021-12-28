/*
 백준 4485 녹색 옷 입은 애가 젤다지?
 21.12.29
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

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let INF = Int(2e9)
var answer = ""
var cnt = 0

func inBound(_ r: Int, _ c: Int, _ N: Int) -> Bool {
  return 0 <= r && r < N && 0 <= c && c < N
}

while true {
  let n = Int(readLine()!)!
  
  if n == 0 { break }
  cnt += 1
  
  var graph = [[Int]](repeating: [Int](), count: n)
  var dist = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
  
  for i in 0 ..< n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
  }
  
  dist[0][0] = graph[0][0]
  
  var pq = PriorityQueue<(Int, Int, Int)>(sort: { $0.0 < $1.0 })
  pq.push((dist[0][0], 0, 0))
  
  while !pq.isEmpty {
    let (w, r, c) = pq.pop()!
    
    if dist[r][c] < w { continue }
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc, n) { continue }
      if w + graph[nr][nc] < dist[nr][nc] {
        dist[nr][nc] = w + graph[nr][nc]
        pq.push((w + graph[nr][nc], nr, nc))
      }
    }
  }
  
  answer += "Problem \(cnt): \(dist[n-1][n-1])\n"
}

print(answer)
