/*
 백준 14284 간선 이어가기 2
 22.05.19
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Heap {
  var heap = [(Int, Int)]()
  
  var isEmpty: Bool {
    return heap.isEmpty
  }
  
  var size: Int {
    return heap.count
  }
  
  mutating func heapPush(_ to: Int, _ cost: Int) {
    var cur = size
    heap.append((to, cost))
    
    while cur > 0  && heap[cur].1 < heap[(cur - 1) / 2].1 {
      let temp = heap[(cur - 1) / 2]
      heap[(cur - 1) / 2] = heap[cur]
      heap[cur] = temp
      cur = (cur - 1) / 2
    }
  }
  
  mutating func heapPop() -> (Int, Int) {
    if size < 2 {
      return heap.removeLast()
    }
    
    let res = heap[0]
    
    heap[0] = heap.removeLast()
    var cur = 0
    
    while cur * 2 + 1 < size {
      var child = 0, left = cur * 2 + 1, right = cur * 2 + 2
      
      if right == size {
        child = left
      } else {
        child = heap[left].1 < heap[right].1 ? left : right
      }
      
      if heap[cur].1 < heap[child].1 { break }
      
      let temp = heap[child]
      heap[child] = heap[cur]
      heap[cur] = temp
      cur = child
    }
    
    return res
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var edges = [[(Int, Int)]](repeating: [(Int, Int)](), count: n + 1)

for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  let a = i[0], b = i[1], c = i[2]
  
  edges[a].append((b, c))
  edges[b].append((a, c))
}

let st = readLine()!.split(separator: " ").map { Int(String($0))! }
let s = st[0], t = st[1]

var visited = [Bool](repeating: false, count: n + 1)

var pq = Heap()
pq.heapPush(s, 0)

while !pq.isEmpty {
  let (now, dist) = pq.heapPop()
  
  visited[now] = true
  
  if now == t {
    print(dist)
    break
  }
  
  for (next, cost) in edges[now] {
    if visited[next] { continue }
    
    pq.heapPush(next, dist + cost)
  }
}
