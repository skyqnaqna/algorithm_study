/*
 백준 1197 최소 스패닝 트리
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let v = input[0], e = input[1]

var edges = [(Int ,Int, Int)]()
var parent = [Int](repeating: 0, count: v + 1)

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

for _ in 0 ..< e {
  let i = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  edges.append((i[2], i[0], i[1]))
}

edges.sort(by: { $0.0 > $1.0 })

for i in 1 ... v {
  parent[i] = i
}

var answer = 0

while !edges.isEmpty {
  let (c, a, b) = edges.removeLast()
  
  if findParent(a) != findParent(b) {
    unionParent(a, b)
    answer += c
  }
}

print(answer)
