/*
 백준 17144 미세먼지 안녕!
 21.11.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

struct Queue<T> {
  var left = [T]()
  var right = [T]()
  
  var isEmpty: Bool {
    return left.isEmpty && right.isEmpty
  }
  
  var count: Int {
    return left.count + right.count
  }
  
  mutating func push(_ element: T) {
    right.append(element)
  }
  
  mutating func pop() -> T? {
    guard !isEmpty else { return nil }
    
    if left.isEmpty {
      left = right.reversed()
      right.removeAll()
    }
    
    return left.removeLast()
  }
  
  func front() -> T? {
    return left.isEmpty ? right.first : left.last
  }
}

let direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var t = input[2]

var graph = [[Int]](repeating: [Int](), count: n)
var airCleaner = [(Int, Int)]()
var dust = Queue<(Int, Int, Int)>()

for i in 0 ..< n {
  graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for j in 0 ..< m {
    if graph[i][j] == -1 {
      airCleaner.append((i, j))
    } else if graph[i][j] != 0 {
      dust.push((i, j, graph[i][j]))
    }
  }
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

func checkDust() {
  for i in 0 ..< n {
    for j in 0 ..< m {
      if graph[i][j] > 0 {
        dust.push((i, j, graph[i][j]))
      }
    }
  }
}

func dustSpread() {
  while !dust.isEmpty {
    let (r, c, d) = dust.pop()!
    
    var cnt = 0
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if !inBound(nr, nc) || graph[nr][nc] < 0 { continue }
      
      graph[nr][nc] += d / 5
      cnt += 1
    }
    
    graph[r][c] += (d - (d / 5) * cnt) - d
  }
}

func rotateAir() {
  var r = airCleaner[0].0, c = airCleaner[0].1
  var i = r, j = c + 1, pre = 0, temp = 0, dir = 0
  
  // 반시계 방향
  while i != r || j != c {
    temp = graph[i][j]
    graph[i][j] = pre
    pre = temp
    
    if !inBound(i + direction[dir].0, j + direction[dir].1) {
      dir = (dir + 3) % 4
    }
    
    i += direction[dir].0
    j += direction[dir].1
  }
  
  // 시계 방향
  r = airCleaner[1].0
  c = airCleaner[1].1
  i = r
  j = c + 1
  pre = 0
  dir = 0
  
  while i != r || j != c {
    temp = graph[i][j]
    graph[i][j] = pre
    pre = temp
    
    if !inBound(i + direction[dir].0, j + direction[dir].1) {
      dir = (dir + 1) % 4
    }
    
    i += direction[dir].0
    j += direction[dir].1
  }
}

while t > 0 {
  t -= 1
  
  dustSpread()
  rotateAir()
  checkDust()
}

var answer = 0

while !dust.isEmpty {
  let (_, _, d) = dust.pop()!
  
  answer += d
}

print(answer)
