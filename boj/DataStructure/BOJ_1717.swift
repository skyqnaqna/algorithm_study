/*
 백준 1717 집합의 표현
 21.08.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]
var m = input[1]

var parent = [Int](repeating: -1, count: n + 1)

for i in parent.indices {
  parent[i] = i
}

func findParent(_ idx: Int) -> Int {
  if idx != parent[idx] {
    parent[idx] = findParent(parent[idx])
  }

  return parent[idx]
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

while m > 0 {
  m -= 1

  let query = readLine()!.split(separator: " ").map { Int(String($0))! }

  if query[0] == 0 {
    unionParent(query[1], query[2])
  } else {
    if findParent(query[1]) == findParent(query[2]) {
      print("YES")
    } else {
      print("NO")
    }
  }
}