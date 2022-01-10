/*
 백준 19238 스타트 택시
 22.01.10
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

let direction = [(-1, 0), (0, -1), (0, 1), (1, 0)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var fuel = input[2]
var graph = [[Int]](repeating: [Int](), count: n)
var passenger = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (0, 0), count: n), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var start = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
for _ in 0 ..< m {
  let info = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
  graph[info[0]][info[1]] = 2
  passenger[info[0]][info[1]] = (info[2], info[3])
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n && graph[r][c] != 1
}

func getDist(_ sr: Int, _ sc: Int, _ dr: Int, _ dc: Int) -> Int {
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  var q = [(Int, Int, Int)](), front = 0
  visited[sr][sc] = true
  q.append((sr, sc, 0))
  
  while front < q.count {
    let (r, c, d) = q[front]
    front += 1
    
    if r == dr && c == dc {
      return d
    }
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) { continue }
      if !visited[nr][nc] {
        visited[nr][nc] = true
        q.append((nr, nc, d + 1))
      }
    }
  }
  
  return -1
}

func findPassenger(_ row: Int, _ col: Int) -> Bool {
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  var q = [(Int, Int, Int)](), front = 0
  visited[row][col] = true
  q.append((row, col, 0))
  
  var candidates = PriorityQueue<(Int, Int, Int)>(sort: {
    if $0.2 == $1.2 {
      if $0.0 == $1.0 {
        return $0.1 < $1.1
      } else {
        return $0.0 < $1.0
      }
    } else {
      return $0.2 < $1.2
    }})
  
  while front < q.count {
    let (r, c, d) = q[front]
    front += 1
    
    if graph[r][c] == 2 {
      candidates.push((r, c, d))
    }
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) { continue }
      if !visited[nr][nc] {
        visited[nr][nc] = true
        q.append((nr, nc, d + 1))
      }
    }
  }
  
  if candidates.isEmpty { return false } // 승객을 찾지 못한 경우
  
  let sr = candidates.peek()!.0
  let sc = candidates.peek()!.1
  let findDist = candidates.peek()!.2
  graph[sr][sc] = 0
  
  let dr = passenger[sr][sc].0
  let dc = passenger[sr][sc].1
  let destDist = getDist(sr, sc, dr, dc)
  
  if destDist == -1 { return false } // 도착지까지 갈 수 없는 경우
  
  if findDist + destDist <= fuel {
    fuel -= findDist
    fuel += destDist
    start = [dr, dc]
    return true
  } else {
    return false
  }
}

func solution() {
  var res = 0
  
  while res < m {
    if findPassenger(start[0], start[1]) {
      res += 1
    } else {
      break
    }
  }
  
  if res == m {
    print(fuel)
  } else {
    print(-1)
  }
}

solution()
