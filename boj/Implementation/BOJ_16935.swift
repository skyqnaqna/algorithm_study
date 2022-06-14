/*
 백준 16935 배열 돌리기 3
 22.06.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = input[0], M = input[1], R = input[2]

var graph = [[Int]]()
var n = N, m = M

for _ in 0 ..< n {
  graph.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func reverseTopBottom() {
  for i in 0 ..< n / 2 {
    graph.swapAt(i, n - 1 - i)
  }
}

func reverseLeftRight() {
  for i in 0 ..< n {
    for j in 0 ..< m / 2 {
      graph[i].swapAt(j, m - 1 - j)
    }
  }
}

func rotateRight() {
  var newGraph = [[Int]]()
  for j in 0 ..< m {
    var temp = [Int]()
    for i in stride(from: n - 1, through: 0, by: -1) {
      temp.append(graph[i][j])
    }
    newGraph.append(temp)
  }
  
  swap(&n, &m)
  graph = newGraph
}

func rotateLeft() {
  var newGraph = [[Int]]()
  for j in stride(from: m - 1, through: 0, by: -1) {
    var temp = [Int]()
    for i in 0 ..< n {
      temp.append(graph[i][j])
    }
    newGraph.append(temp)
  }
  
  swap(&n, &m)
  graph = newGraph
}

func rotateGroupRight() {
  let r1 = 0, r2 = 0, r3 = n / 2, r4 = n / 2
  let c1 = 0, c2 = m / 2, c3 = m / 2, c4 = 0
  
  for i in 0 ..< n / 2 {
    for j in 0 ..< m / 2 {
      let temp = graph[r1 + i][c1 + j]
      graph[r1 + i][c1 + j] = graph[r4 + i][c4 + j]
      graph[r4 + i][c4 + j] = graph[r3 + i][c3 + j]
      graph[r3 + i][c3 + j] = graph[r2 + i][c2 + j]
      graph[r2 + i][c2 + j] = temp
    }
  }
}

func rotateGroupLeft() {
  let r1 = 0, r2 = 0, r3 = n / 2, r4 = n / 2
  let c1 = 0, c2 = m / 2, c3 = m / 2, c4 = 0
  
  for i in 0 ..< n / 2 {
    for j in 0 ..< m / 2 {
      let temp = graph[r1 + i][c1 + j]
      graph[r1 + i][c1 + j] = graph[r2 + i][c2 + j]
      graph[r2 + i][c2 + j] = graph[r3 + i][c3 + j]
      graph[r3 + i][c3 + j] = graph[r4 + i][c4 + j]
      graph[r4 + i][c4 + j] = temp
    }
  }
}

let q = readLine()!.split(separator: " ").map { Int(String($0))! }

for r in q {
  switch r {
  case 1:
    reverseTopBottom()
  case 2:
    reverseLeftRight()
  case 3:
    rotateRight()
  case 4:
    rotateLeft()
  case 5:
    rotateGroupRight()
  default:
    rotateGroupLeft()
  }
}

var answer = ""

for i in 0 ..< n {
  answer += graph[i].map { String($0) }.joined(separator: " ") + "\n"
}

print(answer)
