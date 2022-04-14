/*
 프로그래머스 프렌즈4블록
 22.04.14
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var graph = [[String]]()
var checked = [[Bool]](repeating: [Bool](repeating: false, count: 30), count: 30)
var m = 0, n = 0

func checkBlock(_ r: Int, _ c: Int) {
  let now = graph[r][c]
  if graph[r][c + 1] != now || graph[r + 1][c] != now || graph[r + 1][c + 1] != now {
    return
  }
  
  for i in 0 ... 1 {
    for j in 0 ... 1 {
      checked[r + i][c + j] = true
    }
  }
}

func downBlock() {
  for j in 0 ..< n {
    for i in stride(from: m - 1, to: 0, by: -1) {
      if graph[i][j] == "." {
        var k = i - 1
        while k > 0 && graph[k][j] == "." {
          k -= 1
        }
        
        if graph[k][j] != "." {
          graph[i][j] = graph[k][j]
          graph[k][j] = "."
        }
      }
    }
  }
}

func removeBlock() -> Int {
  var res = 0
  for i in 0 ..< m {
    for j in 0 ..< n {
      if checked[i][j] {
        res += 1
        checked[i][j] = false
        graph[i][j] = "."
      }
    }
  }
  
  return res
}

func solution(_ M:Int, _ N:Int, _ board:[String]) -> Int {
  var answer = 0
  m = M
  n = N
  
  for i in 0 ..< m {
    graph.append(board[i].map { String($0) })
  }
  
  while true {
    for i in 0 ..< m - 1 {
      for j in 0 ..< n - 1 {
        if graph[i][j] == "." { continue }
        checkBlock(i, j)
      }
    }
    
    let res = removeBlock()
    if res == 0 { break }
    answer += res
    downBlock()
  }
  
  return answer
}


print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]  ))
