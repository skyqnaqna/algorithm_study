/*
 프로그래머스 메뉴 리뉴얼
 22.09.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
  var answer = [String]()
  var menuCnt = [Bool](repeating: false, count: 11)
  var menuCombi = [[String: Int]](repeating: [String: Int](), count: 11)

  for i in course { menuCnt[i] = true }

  for order in orders {
    let menu = order.map { String($0) }.sorted(by: <)

    for combi in 3 ..< (1 << menu.count) {

      var cnt = 0, tempMenu = ""

      for i in 0 ..< menu.count {
        if (combi & (1 << i)) != 0 {
          cnt += 1
          tempMenu += menu[i]
        }
      }

      if menuCnt[cnt] {
        menuCombi[cnt][tempMenu, default: 0] += 1
      }
    }
  }

  for i in 2 ... 10 {
    if menuCnt[i] && !menuCombi[i].isEmpty {
      let arr = Array(menuCombi[i]).sorted(by: { $0.value < $1.value })
      let maxCnt = arr.last!.value

      if maxCnt < 2 { continue }

      for (key, val) in arr {
        if val == maxCnt { answer.append(key) }
      }
    }
  }

  return answer.sorted(by: <)
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2, 3, 4]))
