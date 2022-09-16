/*
 프로그래머스 합승 택시 요금
 22.09.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {

  let INF = Int(1e9)
  var dist = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)

  for fare in fares {
    let c = fare[0] - 1, d = fare[1] - 1, f = fare[2]

    dist[c][d] = f
    dist[d][c] = f
  }

  for i in 0 ..< n { dist[i][i] = 0 }

  for k in 0 ..< n {
    for i in 0 ..< n {
      for j in 0 ..< n {
        if i == j { continue }

        let cost = dist[i][k] + dist[k][j]

        if cost < dist[i][j] {
          dist[i][j] = cost
        }
      }
    }
  }

  var answer = dist[s - 1][a - 1] + dist[s - 1][b - 1]

  for i in 0 ..< n {
    if i == s - 1 { continue }
    answer = min(answer, dist[s - 1][i] + dist[i][a - 1] + dist[i][b - 1])
  }

  return answer
}

print(solution(6, 4, 5, 6, [[2,6,6], [6,3,7], [4,6,7], [6,5,11], [2,5,12], [5,3,20], [2,4,8], [4,3,9]]))
