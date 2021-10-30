/*
 21.10.30
 백준 15681 트리와 쿼리
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], r = input[1], q = input[2]

var edges = [[Int]](repeating: [Int](), count: n + 1)
var tree = [[Int]](repeating: [Int](), count: n + 1)
var size = [Int](repeating: 0, count: n + 1)

for _ in 0 ..< n - 1 {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  edges[e[0]].append(e[1])
  edges[e[1]].append(e[0])
}

func makeTree(_ now: Int, _ parent: Int) {
  for node in edges[now] {
    if node != parent {
      tree[now].append(node)
      makeTree(node, now)
    }
  }
}

func countSubtreeNodes(_ now: Int) {
  size[now] = 1
  
  for node in tree[now] {
    countSubtreeNodes(node)
    size[now] += size[node]
  }
}

makeTree(r, -1)
countSubtreeNodes(r)

var answer = ""

for _ in 0 ..< q {
  let x = Int(readLine()!)!
  
  answer += "\(size[x])\n"
}

print(answer)
