// 백준 10423 전기가 부족해
// 21.03.23

import Foundation

func find (_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = find(parent[a])
    return parent[a]
  } else { return a }
}

func union (_ u: Int, _ v: Int) {
  let x = find(u)
  let y = find(v)
  
  if x < y { parent[y] = x }
  else { parent[x] = y }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
let m = input[1]
let k = input[2]
let power = readLine()!.split(separator: " ").map { Int(String($0))! }

var parent = [Int](repeating: 0, count: n + 1)
var edges = [(Int, Int, Int)]()

for i in 1...n { parent[i] = i }
for i in power { parent[i] = 0 }

for _ in 0..<m {
  let cable = readLine()!.split(separator: " ").map { Int(String($0))! }
  edges.append((cable[2], cable[0], cable[1]))
}

edges.sort(by: >)
var cnt = 0
var ans = 0
while cnt < n - k {
  let (w, u, v) = edges.removeLast()
  
  if find(u) != find(v) {
    union(u, v)
    cnt += 1
    ans += w
  }
}

print(ans)
