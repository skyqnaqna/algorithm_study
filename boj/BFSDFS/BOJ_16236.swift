// 백준 16236 아기 상어
// 21.04.25

import Foundation

struct deque<T> {
  private var array: [T?]
  private var size: Int
  private var capacity: Int
  private var head: Int
  
  public init(_ size: Int = 10) {
    self.size = max(size, 1)
    capacity = self.size
    head = capacity
    array = [T?](repeating: nil, count: size)
  }
  
  public var isEmpty: Bool {
    return count == 0
  }
  
  public var count: Int {
    return array.count - head
  }
  
  public mutating func pushBack(_ element: T) {
    array.append(element)
  }
  
  public mutating func push(_ element: T) {
    if head == 0 {
      size *= 2
      let temp = [T?](repeating: nil, count: size)
      array.insert(contentsOf: temp, at: 0)
      head = size
    }
    
    head -= 1
    array[head] = element
  }
  
  public mutating func pop() -> T? {
    if !isEmpty {
      return array.removeLast()
    } else {
      return nil
    }
  }
  
  public mutating func popFront() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    if size >= capacity && head >= size * 2 {
      let amountToRemove = size + size / 2
      array.removeFirst(amountToRemove)
      head -= amountToRemove
      size /= 2
    }
    
    return element
  }
  
  public func peekFront() -> T? {
    if !isEmpty {
      return array.last!
    } else {
      return nil
    }
  }
  
  public func peekBack() -> T? {
    if !isEmpty {
      return array[head]
    } else {
      return nil
    }
  }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
let n = Int(readLine()!)!
var graph = [[Int]]()
var sharkRow = 0
var sharkCol = 0
var size = 2

for i in 0..<n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
  
  for j in 0..<n {
    if graph[i][j] == 9 {
      sharkRow = i
      sharkCol = j
      break
    }
  }
}

func bfs(_ row: Int, _ col: Int, _ size: Int) -> (Int, Int, Int)? {
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  var minDist = Int(1e9)
  var q = deque<(Int, Int, Int)>()
  var candidates = [(Int, Int, Int)]()
  
  visited[row][col] = true
  q.pushBack((row, col, 0))
  
  while !q.isEmpty {
    let (r, c, dist) = q.popFront()!

    for i in stride(from: 0, to: 4, by: 1) {
      let nr = r + dy[i]
      let nc = c + dx[i]
      
      if nr < 0 || nc < 0 || nr >= n || nc >= n || graph[nr][nc] > size { continue }
      
      if !visited[nr][nc] {
        visited[nr][nc] = true
        
        if graph[nr][nc] > 0 && graph[nr][nc] < size && dist + 1 <= minDist {
          minDist = dist + 1
          candidates.append((nr, nc, minDist))
        } else {
          q.pushBack((nr, nc, dist + 1))
        }
      }
    }
  }
  
  if !candidates.isEmpty {
//    candidates.sort(by: { $0.2 == $1.2 ? $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 : $0.2 < $1.2 })
    candidates.sort(by: {
      if $0.2 == $1.2 {
        if $0.0 == $1.0 {
          return $0.1 < $1.1
        } else {
          return $0.0 < $1.0
        }
      } else {
        return $0.2 < $1.2
      }
    })
    
    return candidates[0]
  } else {
    return nil
  }
}

var time = 0
var cnt = 0
while true {
  guard let (r, c, d) = bfs(sharkRow, sharkCol, size) else {
    print(time)
    break
  }
  
  time += d
  cnt += 1
  
  graph[r][c] = 9
  graph[sharkRow][sharkCol] = 0
  sharkRow = r
  sharkCol = c

  if cnt == size {
    size += 1
    cnt = 0
  }
}
