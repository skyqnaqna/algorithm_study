/*
 백준 9489 사촌
 23.02.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var answer = ""

while true {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], k = input[1]

  if n == 0 && k == 0 { break }

  let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

  if n == 1 {
    answer += "0\n"
    continue
  }

  var child = [[Int]](repeating: [Int](), count: n)
  var parent = [Int](repeating: 0, count: n)

  var p = 0, i = 1, ki = 0

  child[p].append(i)
  parent[i] = p
  i += 1

  while i < n {
    if arr[i] - 1 != arr[i - 1] {
      p += 1
    }

    if arr[i] == k { ki = i }

    child[p].append(i)
    parent[i] = p
    i += 1
  }

  let parentIndex = parent[ki]
  let grandParentIndex = parent[parentIndex]
  var cnt = 0

  if parentIndex != grandParentIndex {
    child[grandParentIndex].forEach {
      if $0 != parentIndex {
        cnt += child[$0].count
      }
    }
  }

  answer += "\(cnt)\n"
}

print(answer)
