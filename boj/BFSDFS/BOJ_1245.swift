/*
 백준 1245 농장 관리
 21.07.21
 https://github.com/skyqnaqna/algorithm_study
 */

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

  public func front() -> T? {
    return left.isEmpty ? right.first : left.last
  }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](), count: n)
for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, -1), (1, -1), (-1, 1), (1, 1)]

func bfs(_ row: Int, _ col: Int) -> Bool {
  var valid = true
  var q = Queue<(Int, Int)>()
  visited[row][col] = true;
  q.push((row, col))

  while !q.isEmpty {
    let (r, c) = q.pop()!
    let now = graph[r][c]

    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx

      if nr < 0 || nc < 0 || nr >= n || nc >= m { continue }

      if now < graph[nr][nc] {
        valid = false
      } else if now == graph[nr][nc] && !visited[nr][nc] {
        visited[nr][nc] = true
        q.push((nr, nc))
      }
    }
  }
  return valid
}

var ans = 0
for i in 0 ..< n {
  for j in 0 ..< m {
    if !visited[i][j] && bfs(i, j) {
      ans += 1
    }
  }
}

print(ans)
