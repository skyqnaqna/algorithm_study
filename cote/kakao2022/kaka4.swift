/*
 kakao22 - 4
 21.09.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
  var lion = [Int](repeating: 0, count: 11)
  var ans = [[String]](repeating: [String](), count: 56)

  func recursive(_ idx: Int, _ cnt: Int) {
    if cnt > 0 && idx == 11 {
      return
    }
    if cnt == 0 {
      var a = 0, b = 0 // 어피치, 라이언
      for i in 0 ..< 11 {
        if info[i] == 0 && lion[i] == 0 {
          continue
        }
        if info[i] >= lion[i] {
          a += 10 - i
        } else {
          b += 10 - i
        }
      }

      if a < b {
        ans[b - a].append(lion.reversed().map { String($0) }.joined())
      }

      return
    }

    for i in idx ..< 11 {
      lion[i] += 1
      recursive(i, cnt - 1)
      lion[i] -= 1
    }
  }

  recursive(0, n)


  var res = [Int]()
  for i in stride(from: 55, through: 0, by: -1) {
    if !ans[i].isEmpty {
      ans[i].sort()
      res = ans[i].last!.reversed().map { Int(String($0))! }
      break
    }
  }
  if res.isEmpty {
    return [-1]
  } else {
    return res
  }
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
print(solution(1,[1,0,0,0,0,0,0,0,0,0,0]))
