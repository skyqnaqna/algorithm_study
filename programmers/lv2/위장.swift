/*
 프로그래머스 위장
 21.09.12
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ clothes:[[String]]) -> Int {
  var answer = 0
  var type = [String: Int]()

  for str in clothes {
    type[str[1], default: 0] += 1
  }

  // 각 부위에 안입는 경우를 더해주기
  let res = type.map { $0.1 + 1}

  if type.count > 1 {
    answer = res.reduce(1, *) - 1 // 모든 부위를 안입는 경우 하나 빼주기
  } else {
    answer = res.reduce(0, +) - 1
  }

  return answer
}