/*
 kakao22 - 6
 21.09.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
  var graph = board

  for s in skill {
    let r1 = s[1], c1 = s[2]
    let r2 = s[3], c2 = s[4]
    let degree = s[5]

    if s[0] == 1 {
      for i in r1 ... r2 {
        for j in c1 ... c2 {
          graph[i][j] -= degree
        }
      }
    } else {
      for i in r1 ... r2 {
        for j in c1 ... c2 {
          graph[i][j] += degree
        }
      }
    }
  }

  var ans = 0
  for row in graph {
    for num in row {
      if num > 0 {
        ans += 1
      }
    }
  }

  return ans
}