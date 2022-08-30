/*
 백준 20002 사과나무
 22.08.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var answer = -1111
var graph = [[Int]](repeating: [Int](repeating: 0, count: 301), count: 301)

for i in 1 ... n {
  let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

  for j in 1 ... n {
    if answer < arr[j - 1] { answer = arr[j - 1] }
    graph[i][j] = arr[j - 1]
    graph[i][j] += graph[i][j - 1]
  }
}

for j in 1 ... n {
  for i in 1 ... n {
    graph[i][j] += graph[i - 1][j]
  }
}

for i in 1 ..< n {
  for j in 1 ..< n {
    for k in 1 ..< n {
      if i + k > n || j + k > n { break }

      let val = graph[i + k][j + k] - graph[i - 1][j + k] - graph[i + k][j - 1] + graph[i - 1][j - 1]

      if answer < val { answer = val }
    }
  }
}

print(answer)
