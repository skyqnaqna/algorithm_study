// 백준 16234 인구이동
// 21.05.15

import Foundation

struct Queue<T> {
  private var left = [T]()
  private var right = [T]()
  public init() {}

  public var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }

  public var count: Int {
    return left.count + right.count
  }

  public mutating func push(_ element: T) {
    right.append(element)
  }

  public mutating func pop() -> T? {
    guard !isEmpty else { return nil }

    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }

    return left.removeLast()
  }

  public func peek() -> T? {
    guard !isEmpty else { return nil }

    return left.isEmpty ? right.first : left.last
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let l = input[1]
let r = input[2]
let direction = [(0, -1), (0, 1), (-1, 0), (1, 0)]

var graph = [[Int]](repeating: [Int](), count: n)

for i in 0..<n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

// 인구 차이 확인
func checkGap(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Bool {
  let gap = abs(graph[r1][c1] - graph[r2][c2])
  if gap >= l && gap <= r {
    return true
  } else {
    return false
  }
}

// 주변에 국경선을 공유할 나라가 있는지 확인
func checkOpen(_ r: Int, _ c: Int) -> Bool {
  for (dx, dy) in direction {
    let row = r + dy
    let col = c + dx

    if row < 0 || col < 0 || row >= n || col >= n { continue }

    if checkGap(r, c, row, col) {
      return true
    }
  }
  return false
}

func bfs(_ r: Int, _ c: Int, _ visited: inout [[Bool]]) {
  var q = Queue<(Int, Int, Int)>()
  var union = [(Int, Int, Int)]()

  q.push((r, c, graph[r][c]))
  union.append((r, c, graph[r][c]))
  visited[r][c] = true

  while !q.isEmpty {
    let (preRow, preCol, _) = q.pop()!
    
    for (dx, dy) in direction {
      let row = preRow + dy
      let col = preCol + dx
      
      if row < 0 || col < 0 || row >= n || col >= n { continue }
      
      if !visited[row][col] && checkGap(preRow, preCol, row, col) {
        visited[row][col] = true
        q.push((row, col, graph[row][col]))
        union.append((row, col, graph[row][col]))
      }
    }
  }

  let sum = union.reduce(0) { $0 + $1.2 }
  let newPopulation = sum / union.count
  for (row, col, _) in union {
    graph[row][col] = newPopulation
  }
}

var answer = 0

while true {
  var migrated = false
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  for i in 0..<n {
    for j in 0..<n {
      if !visited[i][j] && checkOpen(i, j) {
        bfs(i, j, &visited)
        migrated = true
      }
    }
  }
  if migrated { answer += 1 }
  else { break }
}

print(answer)