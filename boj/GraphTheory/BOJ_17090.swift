/*
 21.09.29
 백준 17090 미로 탈출하기
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[String]](repeating: [String](), count: n)
var parent = [Int](repeating: 0, count: n * m + 1)

for i in 0 ..< n {
  graph[i] = readLine()!.map { String($0) }
}

// 각 칸은 1번부터 시작
func getId(_ r: Int, _ c: Int) -> Int {
  return r * m + c + 1
}

func getNextPos(_ r: Int, _ c: Int) -> (Int, Int) {
  var nr: Int, nc: Int
  
  switch graph[r][c] {
  case "U":
    nr = r + direction[0].0
    nc = c + direction[0].1
  case "D":
    nr = r + direction[1].0
    nc = c + direction[1].1
  case "L":
    nr = r + direction[2].0
    nc = c + direction[2].1
  case "R":
    nr = r + direction[3].0
    nc = c + direction[3].1
  default:
    return (0, 0)
  }
  
  return (nr, nc)
}

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < m
}

for i in 0 ..< n {
  for j in 0 ..< m {
    let id = getId(i, j)
    parent[id] = id
    
    // 핵심 : 탈출 가능한 지점의 parent값을 0으로 세팅
    let (nr, nc) = getNextPos(i, j)
    
    if !inBound(nr, nc) {
      parent[id] = 0
    }
  }
}

//------Union Find--------------------
func findParent(_ id: Int) -> Int {
  if parent[id] != id {
    parent[id] = findParent(parent[id])
  }
  
  return parent[id]
}

func unionParent(_ a: Int, _ b: Int) {
  let x = findParent(a)
  let y = findParent(b)
  
  if x < y {
    parent[y] = x
  } else {
    parent[x] = y
  }
}
//------------------------------------

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

func dfs(_ r: Int, _ c: Int) {
  let (nr, nc) = getNextPos(r, c)
  
  if !inBound(nr, nc) { return }
  
  let a = getId(r, c), b = getId(nr, nc)
  if findParent(a) != findParent(b) {
    unionParent(a, b)
    visited[nr][nc] = true
    dfs(nr, nc)
  }
}

for i in 0 ..< n {
  for j in 0 ..< m {
    if visited[i][j] { continue }
    
    visited[i][j] = true
    dfs(i, j)
  }
}

var answer = 0

for i in 0 ..< n {
  for j in 0 ..< m {
    if findParent(getId(i, j)) == 0 {
      answer += 1
    }
  }
}

print(answer)
