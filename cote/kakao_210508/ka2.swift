// 2021 카카오 인턴십 2

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

let d = [(0, -1), (0, 1), (-1, 0), (1, 0)]

func getDistance(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) -> Int {
  return abs(r1 - r2) + abs(c1 - c2)
}

func checkDistancing(_ room: [String]) -> Int {
  var graph = [[Int]](repeating: [Int](repeating: 0, count: 5), count: 5)

  // graph 초기화
  for i in 0..<5 {
    let roomToArray = Array(room[i])
    for j in 0..<5 {
      if roomToArray[j] == "P" {
        graph[i][j] = 1
      } else if roomToArray[j] == "X" {
        graph[i][j] = -1
      }
    }
  }

  for i in 0..<5 {
    for j in 0..<5 {
      if graph[i][j] == 1 {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
        let startRow = i
        let startCol = j

        visited[i][j] = true
        var q = Queue<(Int, Int, Int)>()
        q.push((i, j, 0))

        while !q.isEmpty {
          let (row, col, step) = q.pop()!

          for (dx, dy) in d {
            let nextRow = row + dy
            let nextCol = col + dx

            if nextRow < 0 || nextCol < 0 || nextRow > 4 || nextCol > 4 || graph[nextRow][nextCol] == -1 { continue }

            if !visited[nextRow][nextCol] {
              visited[nextRow][nextCol] = true
              q.push((nextRow, nextCol, step + 1))

              if graph[nextRow][nextCol] == 1 {
                let dist = getDistance(startRow, startCol, nextRow, nextCol)
                // 파티션을 사이에 두는 경우를 고려해야하므로 step수를 확인
                if dist <= 2 && step <= 1{
                  return 0
                }
              }
            }
          }
        }
      }
    }
  }

  return 1
}

func solution(_ places:[[String]]) -> [Int] {
  var answer = [Int]()

  for i in 0..<5 {
    answer.append(checkDistancing(places[i]))
  }

  return answer
}

print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPXX", "OXXXP", "POOXX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))