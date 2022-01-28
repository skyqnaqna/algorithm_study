/*
 백준 1922 네트워크 연결
 22.01.28
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var edges = [(Int, Int, Int)]()
var parent = [Int](repeating: 0, count: n + 1)

for _ in 0 ..< m {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  edges.append((i[0], i[1], i[2]))
}

for i in 1 ... n {
  parent[i] = i
}

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

edges.sort(by: { $0.2 < $1.2 })

var answer = 0, cnt = 0

for (u, v, w) in edges {
  if findParent(u) != findParent(v) {
    unionParent(u, v)
    answer += w
    cnt += 1
  }
  
  if cnt == n - 1 { break }
}

print(answer)
