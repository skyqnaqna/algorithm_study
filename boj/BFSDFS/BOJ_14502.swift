// 백준 14502 연구소
// 21.05.12

import Foundation

func combination<T>(_ array: [T], _ r: Int) -> [[T]] {
  guard !array.isEmpty else { return [] }
  let N = array.count
  var temp = [T]()
  var result = [[T]]()
  var visited = [Bool](repeating: false, count: N)

  func dfs(_ index: Int, _ count: Int) {
    if count == r {
      result.append(temp)
    } else {
      for i in stride(from: index, to: N, by: 1) {
        if !visited[i] {
          visited[i] = true
          temp.append(array[i])
          dfs(i + 1, count + 1)
          visited[i] = false
          temp.removeLast()
        }
      }
    }
  }

  dfs(0, 0)
  return result
}

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

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
let d = [(0,-1), (0,1), (-1,0), (1,0)]

var graph = [[Int]](repeating: [Int](), count: n)
var emptySpace = [(Int, Int)]()
var virus = [(Int, Int)]()

for i in stride(from: 0, to: n, by: 1) {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }

  for j in stride(from: 0, to: m, by: 1) {
    if graph[i][j] == 0 {
      emptySpace.append((i, j))
    } else if graph[i][j] == 2 {
      virus.append((i, j))
    }
  }
}

let numOfEmptySpace = emptySpace.count
let candidateWall = combination(emptySpace, 3)

func getSafeArea(_ wallList: [(Int, Int)]) -> Int {
  var safeArea = numOfEmptySpace - 3
  var tempGraph = graph
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

  for (row, col) in wallList {
    tempGraph[row][col] = 1
  }

  var q = Queue<(Int, Int)>()

  for (virusRow, virusCol) in virus {
    if !visited[virusRow][virusCol] {
      visited[virusRow][virusCol] = true
      q.push((virusRow, virusCol))

      while !q.isEmpty {
        let (preRow, preCol) = q.pop()!

        for (dx, dy) in d {
          let row = preRow + dy
          let col = preCol + dx

          if row < 0 || col < 0 || row >= n || col >= m || tempGraph[row][col] == 1 { continue }

          if !visited[row][col] {
            visited[row][col] = true
            q.push((row, col))

            if tempGraph[row][col] == 0 {
              safeArea -= 1
            }
          }
        }
      }
    }
  }
  return safeArea
}

var answer = 0
for candidate in candidateWall {
  let result = getSafeArea(candidate)
  if result > answer {
    answer = result
  }
}

print(answer)
