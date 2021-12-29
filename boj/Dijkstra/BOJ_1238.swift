/*
 백준 1238 파티
 21.12.30
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
let n = input[0], m = input[1], x = input[2]

var homeToParty = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
var partyToHome = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
var dist = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: 2)

dist[0][x] = 0
dist[1][x] = 0

for _ in 0 ..< m {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  partyToHome[e[0]].append((e[1], e[2]))
  homeToParty[e[1]].append((e[0], e[2]))
}

func dijkstra(_ idx: Int) {
  var pq = PriorityQueue<(Int, Int)>(sort: { $0.1 < $1.1 })
  pq.push((x, 0))
  
  while !pq.isEmpty {
    let (now, t) = pq.pop()!
    
    if dist[idx][now] < t { continue }
    
    if idx == 0 {
      for (next, cost) in homeToParty[now] {
        if cost + t < dist[idx][next] {
          dist[idx][next] = cost + t
          pq.push((next, cost + t))
        }
      }
    } else {
      for (next, cost) in partyToHome[now] {
        if cost + t < dist[idx][next] {
          dist[idx][next] = cost + t
          pq.push((next, cost + t))
        }
      }
    }
  }
}

dijkstra(0)
dijkstra(1)

var answer = 0

for i in 1 ... n {
  if answer < dist[0][i] + dist[1][i] {
    answer = dist[0][i] + dist[1][i]
  }
}

print(answer)
