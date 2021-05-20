// 프로그래머스 블록 이동하기
// 21.05.20

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

struct Point: Hashable {
  var x: Int
  var y: Int

  init(_ y: Int, _ x: Int) {
    self.x = x
    self.y = y
  }

  static func == (lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(x)
    hasher.combine(y)
  }
}

func getNextPoints(_ pre: inout Set<Point>, _ graph: inout [[Int]]) -> [Set<Point>] {
  var result = [Set<Point>]()
  let direction = [(0, -1), (0, 1), (-1, 0), (1, 0)]
  let pre1 = pre.removeFirst()
  let pre2 = pre.removeFirst()

  for (dy, dx) in direction {
    let row1 = pre1.y + dy
    let col1 = pre1.x + dx
    let row2 = pre2.y + dy
    let col2 = pre2.x + dx

    if graph[row1][col1] == 0 && graph[row2][col2] == 0 {
      let temp: Set = [Point(row1, col1), Point(row2, col2)]
      result.append(temp)
    }
  }

  // 가로
  if pre1.y == pre2.y {
    for i in [-1, 1] {
      if graph[pre1.y + i][pre1.x] == 0 && graph[pre2.y + i][pre2.x] == 0 {
        let rotate1: Set = [pre1, Point(pre1.y + i, pre1.x)]
        let rotate2: Set = [pre2, Point(pre2.y + i, pre2.x)]
        result.append(rotate1)
        result.append(rotate2)
      }
    }
  }

  // 세로
  if pre1.x == pre2.x {
    for i in [-1, 1] {
      if graph[pre1.y][pre1.x + i] == 0 && graph[pre2.y][pre2.x + i] == 0 {
        let rotate1: Set = [pre1, Point(pre1.y, pre1.x + i)]
        let rotate2: Set = [pre2, Point(pre2.y, pre2.x + i)]
        result.append(rotate1)
        result.append(rotate2)
      }
    }
  }

  return result
}

func solution(_ board:[[Int]]) -> Int {
  let n = board.count
  var graph = [[Int]](repeating: [Int](repeating: 1, count: n + 2), count: n + 2)

  for i in 0..<n {
    for j in 0..<n {
      graph[i + 1][j + 1] = board[i][j]
    }
  }

  var start: Set = [Point(1,1), Point(1,2)]
  var q = Queue<(Set<Point>, Int)>()
  var visited = Set<Set<Point>>()

  visited.insert(start)
  q.push((start, 0))

  while !q.isEmpty {
    var (now, dist) = q.pop()!

    if now.contains(Point(n, n)) {
      return dist
    }

    let nextPoints = getNextPoints(&now, &graph)

    for next in nextPoints {
      if !visited.contains(next) {
        visited.insert(next)
        q.push((next, dist + 1))
      }
    }
  }

  return 0
}

print(solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]))
