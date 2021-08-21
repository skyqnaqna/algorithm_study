/*
 백준 1976 여행 가자
 21.08.21
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let _ = Int(readLine()!)!

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

for i in 1 ... n {
  let info = readLine()!.split(separator: " ").map { Int(String($0))! }

  // 0 ~ n - 1
  for j in info.indices {
    if info[j] == 1 && findParent(i) != findParent(j + 1) {
      unionParent(i, j + 1)
    }
  }
}

let m = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = true
for i in 1 ..< m.count {
  if findParent(m[0]) != findParent(m[i]) {
    ans = false
    break
  }
}

if ans { print("YES") }
else { print("NO") }