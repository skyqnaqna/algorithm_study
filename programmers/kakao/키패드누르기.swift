// 프로그래머스 키패드 누르기
// 21.05.06

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

let keypad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]
let d = [(0, -1), (0, 1), (-1, 0), (1, 0)]

func getDistance(_ startRow: Int, _ startCol: Int, _ target: Int) -> (Int, Int, Int) {
  var visited = [Bool](repeating: false, count: 12)
  var q = Queue<(Int, Int, Int)>() // row, col, dist
  q.push((startRow, startCol, 0))
  visited[keypad[startRow][startCol]] = true
  
  while !q.isEmpty {
    let (row, col, dist) = q.pop()!

    if keypad[row][col] == target {
      return (row, col, dist)
    }

    for (dx, dy) in d {
      let nextRow = row + dy
      let nextCol = col + dx

      if nextRow < 0 || nextCol < 0 || nextRow > 3 || nextCol > 2 { continue }

      if !visited[keypad[nextRow][nextCol]] {
        visited[keypad[nextRow][nextCol]] = true
        q.push((nextRow, nextCol, dist + 1))
      }
    }
  }
  return (0, 0, 0)
}

func solution(_ numbers:[Int], _ hand:String) -> String {
  let left: Set = [1, 4, 7]
  let right: Set = [3, 6, 9]
  var leftRow = 3
  var leftCol = 0
  var rightRow = 3
  var rightCol = 2
  var answer = ""

  for num in numbers {
    if left.contains(num) {
      answer += "L"
      leftRow = (num - 1) / 3
      leftCol = (num - 1) % 3
    } else if right.contains(num) {
      answer += "R"
      rightRow = (num - 1) / 3
      rightCol = (num - 1) % 3
    } else {
      let (lr, lc, ld) = getDistance(leftRow, leftCol, num)
      let (rr, rc, rd) = getDistance(rightRow, rightCol, num)

      if ld > rd || (ld == rd && hand == "right") {
        answer += "R"
        rightRow = rr
        rightCol = rc
      } else if ld < rd || (ld == rd && hand == "left") {
        answer += "L"
        leftRow = lr
        leftCol = lc
      }
    }
  }

  return answer
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))