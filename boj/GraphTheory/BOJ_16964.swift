/*
 백준 16964 DFS 스페셜 저지
 23.01.13
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var tree = [Set<Int>](repeating: Set<Int>(), count: n + 1)

for _ in 0 ..< n - 1 {
  let e = readLine()!.split(separator: " ").map { Int(String($0))! }

  tree[e[0]].insert(e[1])
  tree[e[1]].insert(e[0])
}

let res = readLine()!.split(separator: " ").map { Int(String($0))! }

var answer = 1

if res[0] != 1 {
  answer = 0
} else {
  var pre = [1]

  for i in 1 ..< n {
    var p = pre.last!

    while !tree[p].contains(res[i]) {
      pre.removeLast()

      if pre.isEmpty {
        answer = 0
        break
      }

      p = pre.last!
    }

    if !tree[res[i]].isEmpty {
      pre.append(res[i])
    }
  }
}

print(answer)
