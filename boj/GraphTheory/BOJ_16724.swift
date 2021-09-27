/*
 21.09.28
 백준 16724 피리 부는 사나이
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var parent = [Int](repeating: 0, count: 1000001)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

// 처음은 각 칸의 개수가 집합의 개수 -> union할수록 1개씩 줄어듦
var answer = n * m
var graph = [[String]](repeating: [String](), count: n)

for i in 0 ..< n {
  graph[i] = readLine()!.map { String($0) }
}

// 그래프의 각 칸 번호 구하기
func getId(_ r: Int, _ c: Int) -> Int {
  return r * m + c
}

for i in 0 ..< n {
  for j in 0 ..< m {
    let id = getId(i, j)
    parent[id] = id
  }
}

func getParent(_ id: Int) -> Int {
  if parent[id] != id {
    parent[id] = getParent(parent[id])
  }
  
  return parent[id]
}

func unionParent(_ a: Int, _ b: Int) {
  let x = getParent(a)
  let y = getParent(b)
  
  if x < y {
    parent[y] = x
  } else {
    parent[x] = y
  }
}

func dfs(_ r: Int, _ c: Int) {
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
    return
  }
  
  let a = getId(r, c)
  let b = getId(nr, nc)
  
  // 연결이 안돼있으면 합쳐주고 dfs탐색 반복
  if getParent(a) != getParent(b) {
    unionParent(a, b)
    answer -= 1
    
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

print(answer)
