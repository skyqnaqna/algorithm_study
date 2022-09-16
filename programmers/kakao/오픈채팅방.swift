/*
 프로그래머스 오픈채팅방
 22.09.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ records:[String]) -> [String] {

  var nickname = [String: String]()
  var result = [(Int, String)]()
  var answer = [String]()

  for record in records {
    let info = record.split(separator: " ").map { String($0) }

    let uid = info[1]

    if info[0] == "Enter" {
      nickname[uid] = info[2]
      result.append((0, uid))
    } else if info[0] == "Leave" {
      result.append((1, uid))
    } else {
      nickname[uid] = info[2]
    }
  }

  for res in result {
    if res.0 == 0 {
      answer.append("\(nickname[res.1]!)님이 들어왔습니다.")
    } else {
      answer.append("\(nickname[res.1]!)님이 나갔습니다.")
    }
  }

  return answer
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
