/*
 백준 1926 그림
 21.07.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Queue<T> {
  private var left = [T]()
  private var right = [T]()

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

  public func front() -> T? {
    return left.isEmpty ? right.first : left.last
  }
}

let INF = Int(1e9)
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var pics = [(Int, Int)]()

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }

  for j in 0 ..< m {
    if graph[i][j] == 1 {
      pics.append((i, j))
    }
  }
}

func bfs(_ row: Int, _ col: Int) -> Int {
  var size = 1
  var q = Queue<(Int, Int)>()
  visited[row][col] = true
  q.push((row, col))

  while !q.isEmpty {
    let (r, c) = q.pop()!

    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx

      if nr < 0 || nc < 0 || nr >= n || nc >= m { continue }

      if (!visited[nr][nc] && graph[nr][nc] == 1) {
        visited[nr][nc] = true
        q.push((nr, nc))
        size += 1
      }
    }
  }

  return size
}

var cnt = 0, ans = 0
for (row, col) in pics {
  if !visited[row][col] {
    cnt += 1
    ans = max(ans, bfs(row, col))
  }
}

print(cnt, ans, separator: "\n")