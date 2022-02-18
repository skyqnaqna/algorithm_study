/*
 프로그래머스 파괴되지 않은 건물
 22.02.18
 */

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
  let n = board.count, m = board[0].count
  var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: m + 1), count: n + 1)
  
  for i in skill {
    let type = i[0], r1 = i[1], c1 = i[2], r2 = i[3], c2 = i[4], degree = i[5]
    
    if type == 1 {
      prefixSum[r1][c1] -= degree
      prefixSum[r1][c2 + 1] += degree
      prefixSum[r2 + 1][c1] += degree
      prefixSum[r2 + 1][c2 + 1] -= degree
    } else {
      prefixSum[r1][c1] += degree
      prefixSum[r1][c2 + 1] -= degree
      prefixSum[r2 + 1][c1] -= degree
      prefixSum[r2 + 1][c2 + 1] += degree
    }
  }
  
  var answer = 0
  
  if board[0][0] + prefixSum[0][0] > 0 {
    answer += 1
  }
  
  for j in 1 ..< m {
    prefixSum[0][j] += prefixSum[0][j - 1]
    if board[0][j] + prefixSum[0][j] > 0 {
      answer += 1
    }
  }
  
  for i in 1 ..< n {
    prefixSum[i][0] += prefixSum[i - 1][0]
    if board[i][0] + prefixSum[i][0] > 0 {
      answer += 1
    }
  }
  
  for i in 1 ..< n {
    for j in 1 ..< m {
      prefixSum[i][j] += prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1]
      if board[i][j] + prefixSum[i][j] > 0 {
        answer += 1
      }
    }
  }
//  for i in 0 ... n {
//    for j in 1 ... m {
//      prefixSum[i][j] += prefixSum[i][j - 1]
//    }
//  }
//
//  for j in 0 ... m {
//    for i in 1 ... n {
//      prefixSum[i][j] += prefixSum[i - 1][j]
//    }
//  }
  
  
//  for i in 0 ..< n {
//    for j in 0 ..< m {
//      if board[i][j] + prefixSum[i][j] > 0 {
//        answer += 1
//      }
//    }
//  }
  
  return answer
}
