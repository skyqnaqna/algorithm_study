/*
 백준 9252 LCS 2
 22.01.26
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let A = readLine()!.map { String($0) }
let B = readLine()!.map { String($0) }

var LCS = [[Int]](repeating: [Int](repeating: 0, count: A.count + 1), count: B.count + 1)

func getLength() -> Int {
  for i in 1 ... B.count {
    for j in 1 ... A.count {
      if B[i - 1] != A[j - 1] {
        LCS[i][j] = max(LCS[i - 1][j], LCS[i][j - 1])
      } else {
        LCS[i][j] = LCS[i - 1][j - 1] + 1
      }
    }
  }
  
  return LCS[B.count][A.count]
}

func getString(_ a: Int, _ b: Int) -> String {
  var i = b, j = a
  var res = ""
  
  while LCS[i][j] > 0 {
    if LCS[i - 1][j] == LCS[i][j] {
      i -= 1
    } else if LCS[i][j - 1] == LCS[i][j] {
      j -= 1
    } else {
      res += A[j - 1]
      i -= 1
      j -= 1
    }
  }
  
  return String(res.reversed())
}

let len = getLength()

if len > 0 {
  print(len, getString(A.count, B.count), separator: "\n")
} else {
  print(0)
}
