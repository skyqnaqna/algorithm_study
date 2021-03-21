// 백준 4386 별자리 만들기
// 21.03.22

import Foundation

func getDist (_ a: Int, _ b: Int, _ arr: [(Double, Double)]) -> Double {
  return sqrt(pow(arr[a].0 - arr[b].0, 2) + pow(arr[a].1 - arr[b].1, 2))
}

func find (_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = find(parent[a])
    return parent[a]
  } else { return a }
}

func union (_ a: Int, _ b: Int) {
  let x = find(a)
  let y = find(b)
  
  if x < y { parent[y] = x }
  else { parent[x] = y }
}

let n = Int(readLine()!)!
var stars: [(Double, Double)] = []
var edges: [(Double, Int, Int)] = []
var parent = Array(repeating: 0, count: n)

for i in 0..<n {
  let xy = readLine()!.split(separator: " ").map { Double(String($0))! }
  stars.append((xy[0], xy[1]))
  parent[i] = i
}

for i in 0..<n-1 {
  for j in stride(from: i + 1, to: n, by: 1) {
    edges.append((getDist(i, j, stars), i, j))
  }
}

edges.sort(by: >)
var ans = 0.0
while !edges.isEmpty {
  var w: Double, u: Int, v: Int
  (w, u, v) = edges.removeLast()
  
  if find(u) != find(v) {
    union(u, v)
    ans += w
  }
}

print(String(format: "%.2f", ans))
