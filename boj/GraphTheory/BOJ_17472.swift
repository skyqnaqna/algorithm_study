// 백준 17472 다리 만들기 2
// 21.03.23

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var parent = [Int](repeating: 0, count: 10)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var graph = [[Int]]()
var edges = [(Int, Int, Int)]()

for _ in 0..<n {
  graph.append(readLine()!.split(separator: " ").map {Int(String($0))! })
}

func getLands (_ i: Int, _ j: Int, _ num: Int) {
  var q = [(Int, Int)]()
  q.append((i, j))
  
  while !q.isEmpty {
    let (r, c) = q.removeLast()
    visited[r][c] = true
    graph[r][c] = num
    
    for i in 0...3 {
      let nr = r + dy[i]
      let nc = c + dx[i]
      
      if nr < 0 || nc < 0 || nr >= n || nc >= m { continue }
      
      if graph[nr][nc] == 1 && !visited[nr][nc] { q.append((nr, nc))}
    }
  }
}

func find (_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = find(parent[a])
    return parent[a]
  } else { return a }
}

func union (_ u: Int, _ v: Int){
  let x = find(u)
  let y = find(v)
  
  if x < y { parent[y] = x }
  else { parent[x] = y }
}

func getTempBridge (_ a: Int, _ b: Int) {
  var r = a
  var c = b
  var len = 0

  if c-1 >= 0 && graph[r][c-1] > 0 {
    let pre = graph[r][c-1]
    // 가로 다리 구하기
    while c < m - 1 {
      if graph[r][c] == 0 {
        len += 1
        c += 1
      } else { break } // 다른 섬을 만났거나 맵 끝가지 간 경우
    }
    if graph[r][c] != pre && graph[r][c] > 0 && len > 1 {
      edges.append((len, pre, graph[r][c]))
    }
  }
  
  c = b
  len = 0
  
  if r-1 >= 0 && graph[r-1][c] > 0 {
    let pre = graph[r-1][c]
    // 세로 다리 구하기
    while r < n - 1 {
      if graph[r][c] == 0 {
        len += 1
        r += 1
      } else { break }
    }
    if graph[r][c] != pre && graph[r][c] > 0 && len > 1 {
      edges.append((len, pre, graph[r][c]))
    }
  }
}

var lands = 1
for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 1 && !visited[i][j] {
      getLands(i, j, lands)
      lands += 1
    }
  }
}

for i in 0..<n {
  for j in 0..<m {
    if graph[i][j] == 0 { getTempBridge(i, j) }
  }
}

for i in 1..<lands { parent[i] = i }

edges.sort(by: >)
var ans = 0
var cnt = 0
while !edges.isEmpty {
  let (w, u, v) = edges.removeLast()
  
  if find(u) != find(v) {
    union(u, v)
    ans += w
    cnt += 1
  }
}

if cnt < lands - 2 { print(-1) }
else { print(ans) }
