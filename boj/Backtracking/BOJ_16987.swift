/*
 백준 16987 계란으로 계란치기
 21.07.22
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var ans = 0
var eggs = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
var broken = [Bool](repeating: false, count: n)

for i in 0 ..< n {
  let egg = readLine()!.split(separator: " ").map{ Int(String($0))! }
  eggs[i][0] = egg[0]
  eggs[i][1] = egg[1]
}

func backtracking(_ idx: Int) {
  if idx == n {
    let cnt = broken.filter{ $0 == true }.count
    ans = max(ans, cnt)
    return
  }
  if broken[idx] {
    backtracking(idx + 1)
  } else {
    var nothing = true
    for i in 0 ..< n {
      if i == idx { continue }
      if !broken[i] {
        nothing = false

        eggs[i][0] -= eggs[idx][1]
        eggs[idx][0] -= eggs[i][1]

        if eggs[i][0] <= 0 { broken[i] = true }
        if eggs[idx][0] <= 0 { broken[idx] = true }

        backtracking(idx + 1)

        eggs[i][0] += eggs[idx][1]
        eggs[idx][0] += eggs[i][1]

        if eggs[i][0] > 0 { broken[i] = false }
        if eggs[idx][0] > 0 { broken[idx] = false }
      }
    }
    if nothing { backtracking(idx + 1) }
  }
}

backtracking(0)

print(ans)
