// 백준 9372 상근이의 여행
// 21.03.19

import Foundation

var parent = Array(repeating: 0, count: 1001)

func find(_ a: Int) -> Int {
  if parent[a] != a {
    parent[a] = find(parent[a])
    return parent[a]
  } else { return a }
}

func union(_ a: Int, _ b: Int) {
  let x = find(a)
  let y = find(b)
  
  if x < y { parent[y] = x }
  else { parent[x] = y }
}

var t = Int(readLine()!)!

while t > 0 {
  t -= 1
  
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0]
  let m = input[1]
  var edges: [(Int, Int)] = []
  
  for i in 0...n { parent[i] = i }
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges.append((edge[0], edge[1]))
  }
  
  var ans = 0
  while !edges.isEmpty {
    let (u, v) = edges.removeLast()
    
    if find(u) != find(v) {
      union(u, v)
      ans += 1
    }
  }
  print(ans)
}
