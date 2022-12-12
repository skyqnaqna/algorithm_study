/*
 백준 2659 십자카드 문제
 22.12.12
 https://github.com/skyqnaqna/algorithm_study
*/

import Foundation

let input = readLine()!.split(separator: " ").map { String($0) }

func getClockNum(_ arr: [String]) -> String {
  var a = "", b = "", c = "", d = ""

  for i in 0 ..< 4 {
    a += arr[i]
    b += arr[(1 + i) % 4]
    c += arr[(2 + i) % 4]
    d += arr[(3 + i) % 4]
  }

  return min(min(a, b), min(c, d))
}

let target = getClockNum(input)

var numSet = Set<String>()

func recursive(_ s: [String]) {
  if s.count == 4 {
    numSet.insert(getClockNum(s))

    return
  }

  for i in 1 ... 9 {
    recursive(s + [String(i)])
  }
}

recursive([])

for (i, num) in Array(numSet).sorted(by: <).enumerated() {
  if num == target {
    print(i + 1)

    break
  }
}
