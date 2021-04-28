// 백준 3190 뱀
// 21.04.28

import Foundation

struct Queue<T> {
  private var left = [T]()
  private var right = [T]()
  public init() {}
  
  public var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }
  
  public var count: Int {
    if !left.isEmpty {
      return left.count + right.count
    } else {
      return right.count
    }
  }
  
  public func peek() -> T? {
    if !left.isEmpty {
      return left.last
    } else {
      return right.first
    }
  }
  
  public mutating func push(_ element: T) -> Bool {
    right.append(element)
    return true
  }
  
  public mutating func pop() -> T? {
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    
    return left.popLast()
  }
}

let n = Int(readLine()!)!
let apple = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](repeating: 0, count: n + 2), count: n + 2)
var isBody = [[Bool]](repeating: [Bool](repeating: false, count: n + 2), count: n + 2)

for _ in stride(from: 0, to: apple, by: 1) {
  let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  graph[xy[0]][xy[1]] = 1 // 사과 위치 저장
}

let l = Int(readLine()!)!
var changeDirection = [(Int, Int)]()
// 상, 우, 하, 좌
var dy = [-1, 0, 1, 0]
var dx = [0, 1, 0, -1]

for _ in stride(from: 0, to: l, by: 1) {
  let s = readLine()!.split(separator: " " ).map { String($0) }
  
  if s[1] == "D" {
    changeDirection.append((Int(s[0])!, 1))
  } else {
    changeDirection.append((Int(s[0])!, -1))
  }
}

var time = 0
var tailQueue = Queue<(Int, Int)>()
var size = 1
var indexOfDirect = 1
var indexOfTime = 0
var row = 1
var col = 1

tailQueue.push((1, 1))
isBody[1][1] = true

while true {
  if indexOfTime < l && time == changeDirection[indexOfTime].0 {
    if changeDirection[indexOfTime].1 == 1 {
      indexOfDirect = (indexOfDirect + 1) % 4
    } else {
      indexOfDirect = indexOfDirect - 1 < 0 ? 3 : indexOfDirect - 1
    }
    indexOfTime += 1
  }
  
  let nextRow = row + dy[indexOfDirect]
  let nextCol = col + dx[indexOfDirect]
  
  if nextRow < 1 || nextCol < 1 || nextRow > n || nextCol > n || isBody[nextRow][nextCol] {
    time += 1
    break
  }

  if graph[nextRow][nextCol] == 1 {
    size += 1
    graph[nextRow][nextCol] = 0
  } else {
    let (tailRow, tailCol) = tailQueue.pop()!
    isBody[tailRow][tailCol] = false
  }
  
  tailQueue.push((nextRow, nextCol))
  isBody[nextRow][nextCol] = true
  row = nextRow
  col = nextCol
  time += 1
}

print(time)
