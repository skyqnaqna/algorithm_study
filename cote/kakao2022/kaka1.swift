/*
 kakao22 - 1
 21.09.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
  var user = [String: Int]()
  var answer = [Int](repeating: 0, count: id_list.count)

  for i in id_list.indices {
    user[id_list[i]] = i
  }

  var reported = [Set<String>](repeating: Set<String>(), count: id_list.count)

  for str in report {
    let id = str.split(separator: " ").map { String($0) }

    reported[user[id[1]]!].insert(id[0])
  }

  for i in reported.indices {
    if reported[i].count >= k {
      for id in reported[i] {
        answer[user[id]!] += 1
      }
    }
  }

  return answer
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))