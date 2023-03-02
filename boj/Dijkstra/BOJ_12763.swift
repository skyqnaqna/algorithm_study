/*
 백준 12763 지각하면 안 돼
 23.03.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let t = input[0], m = input[1]
let l = Int(readLine()!)!
let INF = 1000001

var graph = [[(Int, Int, Int)]](repeating: [(Int, Int, Int)](), count: n + 1)
var memo = [Set<[Int]>](repeating: Set<[Int]>(), count: n + 1)

for _ in 0 ..< l {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }

  graph[i[0]].append((i[1], i[2], i[3]))
  graph[i[1]].append((i[0], i[2], i[3]))
}

var heap = [(Int, Int, Int)]()
var size = 0

func heapPush(_ item: (Int, Int, Int)) {
  heap.append(item)
  var cur = size

  while cur > 0 && heap[cur].0 <= heap[(cur - 1) / 2].0 {
    if heap[cur].0 == heap[(cur - 1) / 2].0,
       heap[cur].1 >= heap[(cur - 1) / 2].1 {
      break
    }

    let temp = heap[(cur - 1) / 2]
    heap[(cur - 1) / 2] = heap[cur]
    heap[cur] = temp
    cur = (cur - 1) / 2
  }

  size += 1
}

func heapPop() -> (Int, Int, Int) {
  let res = heap[0]
  size -= 1
  heap[0] = heap[size]
  heap.removeLast()

  var cur = 0

  while cur * 2 + 1 < size {
    let left = cur * 2 + 1, right = cur * 2 + 2
    var child = 0

    if cur * 2 + 2 == size {
      child = left
    } else if heap[left].0 == heap[right].0 {
      child = heap[left].1 < heap[right].1 ? left :right
    } else {
      child = heap[left].0 < heap[right].0 ? left : right
    }

    if heap[child].0 > heap[cur].0 ||
        (heap[child].0 == heap[cur].0 && heap[child].1 >= heap[cur].1) {
      break
    }

    let temp = heap[child]
    heap[child] = heap[cur]
    heap[cur] = temp
    cur = child
  }

  return res
}


memo[1].insert([0, 0])
heapPush((0, 0, 1))

while size > 0 {
  let (cost, time, now) = heapPop()

  for (next, _time, _cost) in graph[now] {
    let nTime = time + _time
    let nCost = cost + _cost

    if nTime > t { continue }
    if nCost > m { continue }
    if memo[next].contains([nCost, nTime]) { continue }

    memo[next].insert([nCost, nTime])
    heapPush((nCost, nTime, next))
  }
}

print(memo[n].isEmpty ? -1 : memo[n].map { $0[0] }.min()!)
