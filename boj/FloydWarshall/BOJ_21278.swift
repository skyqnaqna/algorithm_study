/*
 21.10.13
 백준 21278 호석이 두 마리 치킨
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let INF = Int(1e9)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

var graph = [[Int]](repeating: [Int](repeating: INF, count: n + 1), count: n + 1)

for _ in 0 ..< m {
  let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  graph[edge[0]][edge[1]] = 1
  graph[edge[1]][edge[0]] = 1
}

// 플로이드 와샬로 각 건물끼리의 최단거리 구하기
for k in 1 ... n {
  for i in 1 ... n {
    for j in 1 ... n {
      if i == j {
        graph[i][j] = 0
        continue
      }
      
      if graph[i][k] + graph[k][j] < graph[i][j] {
        graph[i][j] = graph[i][k] + graph[k][j]
      }
    }
  }
}

var dist = INF, first = -1, second = -1

// 건물 두 개(i, j)를 구해서 나머지 건물에서 두 치킨집 중 가까운 곳 거리 구해서 최소거리 구하기
for i in 1 ..< n {
  for j in i + 1 ... n {
    var tempDist = 0
    for k in 1 ... n {
      if k == i || k == j {
        continue
      }
      tempDist += min(graph[k][i], graph[k][j])
    }
    
    if tempDist < dist {
      dist = tempDist
      first = i
      second = j
    }
  }
}

print(first, second, dist * 2)
