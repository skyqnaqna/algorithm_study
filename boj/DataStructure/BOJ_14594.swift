/*
 백준 14594 동방 프로젝트 (Small)
 21.12.20
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var parent = [Int](repeating: 0, count: n + 1)

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

for i in 0 ... n {
  parent[i] = i
}

var rooms = n

for _ in 0 ..< m {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  var i = input[0] + 1
  
  while i <= input[1] {
    if findParent(i - 1) != findParent(i) {
      unionParent(i - 1, i)
      rooms -= 1
    }
    i += 1
  }
}

print(rooms)
