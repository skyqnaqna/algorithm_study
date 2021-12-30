/*
 백준 9370 미확인 도착지
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
let t = Int(readLine()!)!
var answer = ""

func main() -> String {
  var input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], m = input[1], t = input[2]
  
  input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let s = input[0], g = input[1], h = input[2]
  
  var graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)
  , dist = [(Int, Bool)](repeating: (INF, false), count: n + 1)
  , target = [Int]()
  
  for _ in 0 ..< m {
    let e = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    graph[e[0]].append((e[1], e[2]))
    graph[e[1]].append((e[0], e[2]))
  }
  
  for _ in 0 ..< t {
    target.append(Int(readLine()!)!)
  }
  
  var pq = PriorityQueue<(Int, Int, Bool)>(sort: { $0.1 < $1.1 })
  dist[s].0 = 0
  pq.push((s, 0, false))
  
  while !pq.isEmpty {
    let (now, d, passed) = pq.pop()!
    
    if dist[now].0 < d { continue }
    
    for (next, w) in graph[now] {
      if d + w < dist[next].0 {
        dist[next].0 = d + w
        
        // g <-> h 를 지나는 경우와 아닌 경우 나누기
        if passed || (now == g || now == h) && (next == g || next == h) {
          pq.push((next, d + w, true))
          dist[next].1 = true
        } else {
          pq.push((next, d + w, false))
          dist[next].1 = false
        }
        // 거리가 같을 때 g <-> h 를 지나온 경우라면 새로 갱신해주고 PQ에 넣어주기
      } else if d + w == dist[next].0 && dist[next].1 == false {
        if passed || (now == g || now == h) && (next == g || next == h) {
          pq.push((next, d + w, true))
          dist[next].1 = true
        }
      }
    }
  }
  
  var res = [Int]()
  for i in target {
    if dist[i].1 {
      res.append(i)
    }
  }
  res.sort()
  
  return res.map { String($0) }.joined(separator: " ")
}

for _ in 0 ..< t {
  answer += main() + "\n"
}

print(answer)

