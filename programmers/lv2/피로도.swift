/*
 프로그래머스 피로도
 22.06.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
  let n = dungeons.count
  var visited = [Bool](repeating: false, count: n)
  var answer = 0
  
  func recursive(_ cnt: Int, _ nowK: Int) {
    if answer < cnt {
      answer = cnt
    }
    
    if nowK == 0 {
      return
    }
    
    for i in 0 ..< n {
      if visited[i] { continue }
      
      if dungeons[i][0] <= nowK {
        visited[i] = true
        recursive(cnt + 1, nowK - dungeons[i][1])
        visited[i] = false
      }
    }
  }
  
  recursive(0, k)
  
  return answer
}
