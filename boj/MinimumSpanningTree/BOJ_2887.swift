// 백준 2887 행성 터널
// 21.03.17

import Foundation

func find (a: Int) -> Int {
  if parent[a] != a {
    parent[a] = find(a: parent[a])
    return parent[a]
  }
  else { return a }
}

func union (a: Int, b: Int) {
  let x = find(a: a)
  let y = find(a: b)
  
  if x < y { parent[y] = x }
  else { parent[x] = y }
}

let n = Int(readLine()!)!
var parent = Array(repeating: 0, count: n + 1)
var x: [(Int, Int)] = []
var y: [(Int, Int)] = []
var z: [(Int, Int)] = []

for i in stride(from: 1, through: n, by: 1) {
  let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
  x.append((temp[0], i))
  y.append((temp[1], i))
  z.append((temp[2], i))
  parent[i] = i
}

x.sort(by: { $0.0 < $1.0 })
y.sort(by: { $0.0 < $1.0 })
z.sort(by: { $0.0 < $1.0 })

var edges: [(Int, Int, Int)] = []
for i in stride(from: 1, to: n, by: 1) {
  edges.append((abs(x[i].0 - x[i-1].0), x[i].1, x[i-1].1))
  edges.append((abs(y[i].0 - y[i-1].0), y[i].1, y[i-1].1))
  edges.append((abs(z[i].0 - z[i-1].0), z[i].1, z[i-1].1))
}

edges.sort(by: { $0.0 > $1.0 })
var sum = 0

while !edges.isEmpty {
  let pop = edges.removeLast()
  let w = pop.0
  let u = pop.1
  let v = pop.2
  
  if find(a: u) != find(a: v) {
    union(a: u, b: v)
    sum += w
  }
}

print(sum)
