/*
 21.10.16
 백준 2307 도로검문
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

let INF = Int(2e9)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var edges = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
var path = [Int](repeating: 0, count: n + 1)

for _ in 0 ..< m {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  edges[e[0]].append((e[1], e[2]))
  edges[e[1]].append((e[0], e[2]))
}

func dijkstra(_ u: Int, _ v: Int) -> Int {
  var pq = PriorityQueue<(Int, Int)>(sort: <)
  var dist = [Int](repeating: INF, count: n + 1)
  dist[1] = 0
  pq.push((0, 1))
  
  while !pq.isEmpty {
    let (cost, now) = pq.pop()!
    
    if dist[now] < cost { continue }
    
    for (next, d) in edges[now] {
      if (next == u && now == v) || (next == v && now == u) { continue }
      
      if cost + d < dist[next] {
        dist[next] = cost + d
        pq.push((cost + d, next))
        path[next] = now
      }
    }
  }
  
  return dist[n]
}

let minTime = dijkstra(0, 0)

var pre = n
var candidates = [(Int, Int)]()

while pre != 1 {
  candidates.append((path[pre], pre))
  pre = path[pre]
}

var answer = 0

for (u, v) in candidates {
  let res = dijkstra(u, v)
  
  if res == INF {
    answer = -1
    break
  }
  
  if minTime < res {
    answer = max(answer, res - minTime)
  }
}

print(answer)
