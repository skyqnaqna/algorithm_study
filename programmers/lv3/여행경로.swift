/*
 프로그래머스 여행경로
 22.04.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ tickets:[[String]]) -> [String] {
  var t = [String: [String]]()
  var visited = [String: [Bool]]()
  var answer = [[String]]()
  
  for i in tickets.indices {
    t[tickets[i][0], default: [String]()].append(tickets[i][1])
    t[tickets[i][0]]!.sort(by: <)
    visited[tickets[i][0], default: [Bool]()].append(false)
  }
  
  func dfs(_ from: String, _ res: [String]) {
    if res.count == tickets.count + 1 {
      answer.append(res)
      return
    }
    
    if t[from] == nil { return }
    
    for i in t[from]!.indices {
      if !visited[from]![i] {
        let next = t[from]![i]
        
        visited[from]![i] = true
        dfs(next, res + [next])
        visited[from]![i] = false
      }
    }
  }
  
  dfs("ICN", ["ICN"])
  
  return answer[0]
}


print(solution([["ICN", "B"], ["B", "ICN"], ["ICN", "A"], ["A", "D"], ["D", "A"]]))
print(solution([["ICN", "AAA"], ["ICN", "AAA"], ["ICN", "AAA"], ["AAA", "ICN"], ["AAA", "ICN"]]))
print(solution([["ICN", "SFO"], ["SFO", "ICN"], ["ICN", "SFO"], ["SFO", "QRE"]]))
