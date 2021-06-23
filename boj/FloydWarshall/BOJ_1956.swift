/*
 백준 1956 운동
 21.06.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let v = input[0], e = input[1]
let INF = Int(1e9)

var dist = [[Int]](repeating: [Int](repeating: INF, count: v + 1), count: v + 1)

for _ in 0 ..< e {
  let l = readLine()!.split(separator: " ").map{ Int(String($0))! }
  let a = l[0], b = l[1], c = l[2]

  dist[a][b] = c
}

for k in 1 ... v {
  for i in 1 ... v {
    for j in 1 ... v {
      if dist[i][k] + dist[k][j] < dist[i][j] {
        dist[i][j] = dist[i][k] + dist[k][j]
      }
    }
  }
}

var answer = INF
for i in 1 ... v {
  if dist[i][i] < answer {
    answer = dist[i][i]
  }
}

if answer == INF {
  answer = -1
}

print(answer)

