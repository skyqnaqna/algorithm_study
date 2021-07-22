/*
 백준 17836 공주님을 구해라!
 21.07.22
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
let n = input[0], m = input[1], t = input[2]
var gr = 0, gc = 0

var graph = [[Int]](repeating: [Int](), count: n)
var dist = [[Int]](repeating: [Int](repeating: INF, count: m), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }

  for j in 0 ..< m {
    if graph[i][j] == 2 {
      gr = i
      gc = j
    }
  }
}

var q = Queue<(Int, Int, Int)>()
dist[0][0] = 0
visited[0][0] = true
q.push((0, 0, 0))

while !q.isEmpty {
  let (d, r, c) = q.pop()!

  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx

    if nr < 0 || nc < 0 || nr >= n || nc >= m { continue }

    if (!visited[nr][nc] && graph[nr][nc] != 1) {
      visited[nr][nc] = true
      dist[nr][nc] = d + 1
      q.push((d + 1, nr, nc))
    }
  }
}

let fromGramTo = n - gr + m - gc - 2 + dist[gr][gc]
let ans = min(dist[n-1][m-1], fromGramTo)

if ans <= t && ans != INF {
  print(ans)
} else {
  print("Fail")
}
