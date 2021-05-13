// 백준 18405 경쟁적 전염
// 21.05.13

import Foundation

struct Queue<T> {
  private var left = [T]()
  private var right = [T]()
  init() {}

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
    return left.isEmpty ? right.first : left.last
  }
}

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let k = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
var virus = [(Int, Int, Int)]()
var q = Queue<(Int, Int, Int, Int)>()
let direction = [(0, -1), (0, 1), (-1, 0), (1, 0)]

for i in 0..<n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }

  for j in 0..<n {
    if graph[i][j] != 0 {
      virus.append((graph[i][j], i, j))
    }
  }
}

virus.sort(by: { $0.0 < $1.0 })
for (k, i, j) in virus {
  q.push((k, 0, i, j))
}

input = readLine()!.split(separator: " ").map { Int(String($0))! }
let s = input[0]
let x = input[1]
let y = input[2]

while !q.isEmpty {
  let (k, dist, preRow, preCol) = q.pop()!
  if dist >= s { break }

  for (dx, dy) in direction {
    let row = preRow + dy
    let col = preCol + dx

    if row < 0 || row >= n || col < 0 || col >= n { continue }

    if graph[row][col] == 0 {
      graph[row][col] = k
      q.push((k, dist + 1, row, col))
    }
  }
}

print(graph[x-1][y-1])