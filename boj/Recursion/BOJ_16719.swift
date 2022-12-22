/*
 백준 16719 ZOAC
 22.12.22
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let str = readLine()!.map { String($0) }
let n = str.count

var isUsed = [Bool](repeating: false, count: n)

func getWord() -> String {
  var res = ""

  for i in 0 ..< n {
    if isUsed[i] { res += str[i] }
  }

  return res
}

var answer = ""

func recursive(_ l: Int, _ r: Int) {
  if l > r { return }

  var idx = l

  for i in l ... r {
    if str[i] < str[idx] {
      idx = i
    }
  }

  isUsed[idx] = true
  answer += getWord() + "\n"

  // 사전순으로 가장 먼저 오는 글자를 기준으로 오른쪽 먼저 탐색하면 오름차순으로 구한다
  recursive(idx + 1, r)

  // 오른쪽 탐색 끝나면 왼쪽 탐색
  recursive(l, idx - 1)
}

recursive(0, n - 1)
print(answer)

//var answer = [String](repeating: "", count: n + 1)

//func recursive(_ cnt: Int) {
//  if cnt == n {
//    return
//  }
//
//  var temp = ""
//  var idx = 0
//
//  for i in 0 ..< n {
//    if isUsed[i] { continue }
//
//    isUsed[i] = true
//    let word = getWord()
//
//    if temp.isEmpty || word < temp {
//      idx = i
//      temp = word
//    }
//
//    isUsed[i] = false
//  }
//
//  isUsed[idx] = true
//
//  answer[cnt + 1] = temp
//  recursive(cnt + 1)
//}
//
//recursive(0)
//
//answer.removeFirst()
//
//print(answer.joined(separator: "\n"))
