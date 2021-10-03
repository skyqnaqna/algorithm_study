/*
 21.10.04
 백준 1944 복제 로봇
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1]
var start = 0, end = 0

var graph = [[String]](repeating: [String](), count: n)
var keys = [(Int, Int)]()

func inBound(_ r: Int, _ c: Int) -> Bool {
  return 0 <= r && r < n && 0 <= c && c < n && graph[r][c] != "1"
}

for i in 0 ..< n {
  graph[i] = readLine()!.map { String($0) }
  
  for j in 0 ..< n {
    if graph[i][j] == "S" {
      start = i
      end = j
    } else if graph[i][j] == "K" {
      keys.append((i, j))
    }
  }
}

// 각 그래프의 칸 고유 id
func getId(_ r: Int, _ c: Int) -> Int {
  return r * n + c
}

// S가 0번, 1번 부터 Key
var nodes = [(Int, Int)]()
nodes.append((start, end))

for key in keys {
  nodes.append(key)
}

// 키는 각 칸의 id, 값은 nodes 배열에서 인덱스 번호
var getNodeIndex = [Int: Int]()

for i in nodes.indices {
  getNodeIndex[getId(nodes[i].0, nodes[i].1)] = i
}

// 시작점과 키들 사이의 거리정보를 갖는 간선들 저장
var edges = [(Int, Int, Int)]()

func getEdges(_ id: Int) {
  let startNode = getNodeIndex[id]!
  let (row, col) = nodes[startNode]
  
  var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
  visited[row][col] = true
  
  var q = [(Int, Int, Int)](), front = 0
  q.append((row, col, 0))
  
  while front < q.count {
    
    let (r, c, dist) = q[front]
    front += 1
    
    for (dy, dx) in direction {
      let nr = r + dy
      let nc = c + dx
      
      if inBound(nr, nc) && !visited[nr][nc] {
        visited[nr][nc] = true
        q.append((nr, nc, dist + 1))
        
        if graph[nr][nc] == "K" {
          let id = getId(nr, nc)
          let idx = getNodeIndex[id]!
          
          edges.append((dist + 1, startNode, idx))
        }
      }
    }
  }
}

// 간선들을 구하고 유니온 파인드로 최소 거리를 구함
for node in nodes {
  getEdges(getId(node.0, node.1))
}

var parent = [Int](repeating: 0, count: m + 1)
for i in parent.indices {
  parent[i] = i
}

func findParent(_ x: Int) -> Int {
  if parent[x] != x {
    parent[x] = findParent(parent[x])
  }
  
  return parent[x]
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

edges.sort(by: { $0.0 < $1.0 })
var remainUnion = m + 1
var answer = 0

for (dist, from, to) in edges {
  if findParent(from) != findParent(to) {
    unionParent(from, to)
    remainUnion -= 1
    answer += dist
  }
}

if remainUnion > 1 {
  print(-1)
} else {
  print(answer)
}
