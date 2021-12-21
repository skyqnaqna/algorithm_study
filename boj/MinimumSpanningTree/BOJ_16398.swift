/*
 백준 16398 행성 연결
 21.12.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var edges = [(Int, Int, Int)]()
var parent = [Int](repeating: 0, count: n)

for i in 0 ..< n {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  for j in i + 1 ..< n {
    edges.append((e[j], i, j))
  }
  parent[i] = i
}

edges.sort(by: { $0.0 > $1.0 })

func findParent(_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = findParent(parent[a])
  }
  return parent[a]
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

var cnt = 0, answer = 0
while cnt < n - 1 && !edges.isEmpty {
  let (w, u, v) = edges.removeLast()
  
  if findParent(u) != findParent(v) {
    unionParent(u, v)
    cnt += 1
    answer += w
  }
}

print(answer)
