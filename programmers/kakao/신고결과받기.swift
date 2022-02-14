/*
 프로그래머스 신고 결과 받기
 22.02.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ id_list:[String], _ _report:[String], _ k:Int) -> [Int] {
  var nameToIdx = [String: Int]()
  var report = [Set<String>](repeating: Set<String>(), count: id_list.count)
  var reportedCnt = [String: Int]()
  var answer = [Int]()
  
  for i in id_list.indices {
    nameToIdx[id_list[i]] = i
  }
  
  for str in _report {
    let name = str.split(separator: " ").map { String($0) }
    
    let from = name[0], to = name[1]
    if !report[nameToIdx[from]!].contains(to) {
      report[nameToIdx[from]!].insert(to)
      reportedCnt[to, default: 0] += 1
    }
  }
  
  for reportSet in report {
    var res = 0
    for name in reportSet {
      if reportedCnt[name]! >= k {
        res += 1
      }
    }
    answer.append(res)
  }
  
  return answer
}
