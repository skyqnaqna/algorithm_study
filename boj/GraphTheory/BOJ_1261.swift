/*
 백준 1261 알고스팟
 21.12.29
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

/*
 Written for Swift Algorithm Club by Matthijs Hollemans
 https://github.com/raywenderlich/swift-algorithm-club/tree/master/Deque
 */
public struct Deque<T> {
  private var array: [T?]
  private var head: Int
  private var capacity: Int
  private let originalCapacity: Int
  
  public init(_ capacity: Int = 10) {
    self.capacity = max(capacity, 1)
    originalCapacity = self.capacity
    array = [T?](repeating: nil, count: capacity)
    head = capacity
  }
  
  public var isEmpty: Bool {
    return count == 0
  }
  
  public var count: Int {
    return array.count - head
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func enqueueFront(_ element: T) {
    if head == 0 {
      capacity *= 2
      let emptySpace = [T?](repeating: nil, count: capacity)
      array.insert(contentsOf: emptySpace, at: 0)
      head = capacity
    }
    
    head -= 1
    array[head] = element
  }
  
  public mutating func dequeueFront() -> T? {
    guard head < array.count, let element = array[head] else { return nil }
    
    array[head] = nil
    head += 1
    
    if capacity >= originalCapacity && head >= capacity*2 {
      let amountToRemove = capacity + capacity/2
      array.removeFirst(amountToRemove)
      head -= amountToRemove
      capacity /= 2
    }
    return element
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeLast()
    }
  }
  
  public func peekFront() -> T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
  
  public func peekBack() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.last!
    }
  }
}

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[1], m = input[0]

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

var graph = [[Int]](repeating: [Int](), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.map { Int(String($0))! }
}

var deck = Deque<(Int, Int, Int)>()
deck.enqueue((0, 0, 0))
visited[0][0] = true

while !deck.isEmpty {
  let (r, c, w) = deck.dequeueFront()!
  
  if r == n - 1 && c == m - 1 {
    print(w)
    break
  }
  
  for (dy, dx) in direction {
    let nr = r + dy
    let nc = c + dx
    
    if !inBound(nr, nc) || visited[nr][nc] { continue }
    if graph[nr][nc] == 0 {
      deck.enqueueFront((nr, nc, w))
    } else {
      deck.enqueue((nr, nc, w + 1))
    }
    visited[nr][nc] = true
  }
}
