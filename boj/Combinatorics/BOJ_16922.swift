/*
 백준 16922 로마 숫자 만들기
 22.08.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

let romanNum = [1, 5, 10, 50]

var numSet = Set<Int>()

func recursion(_ idx: Int, _ val: Int, _ cnt: Int) {
  if cnt == n {
    numSet.insert(val)

    return
  }

  for i in idx ..< 4 {
    recursion(i, val + romanNum[i], cnt + 1)
  }
}

recursion(0, 0, 0)

print(numSet.count)
