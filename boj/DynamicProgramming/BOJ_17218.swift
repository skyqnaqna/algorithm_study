/*
 백준 17218 비밀번호 만들기
 22.10.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let a = readLine()!.map { String($0) }
let b = readLine()!.map { String($0) }
let n = a.count
let m = b.count

var lcs = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)

for i in 1 ... m {
  for j in 1 ... n {
    if a[j - 1] == b[i - 1] {
      lcs[i][j] = lcs[i - 1][j - 1] + 1
    } else {
      lcs[i][j] = max(lcs[i][j - 1], lcs[i - 1][j])
    }
  }
}

var i = m, j = n, res = ""
while lcs[i][j] > 0 {
  if lcs[i - 1][j] == lcs[i][j] {
    i -= 1
  } else if lcs[i][j - 1] == lcs[i][j] {
    j -= 1
  } else {
    res += a[j - 1]
    i -= 1
    j -= 1
  }
}

print(String(res.reversed()))
