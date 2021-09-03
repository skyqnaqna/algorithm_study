/*
 백준 2876 그래픽스 퀴즈
 21.09.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var grade = [[Int]](repeating: [Int](repeating: 0, count: 5), count: n + 1)

let first = readLine()!.split(separator: " ").map { Int(String($0))! }
grade[0][first[0] - 1] = 1
grade[n][first[0] - 1] = 1
grade[0][first[1] - 1] = 1
grade[n][first[1] - 1] = 1

for i in 1 ..< n {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let s1 = input[0] - 1, s2 = input[1] - 1

  if grade[i - 1][s1] > 0 {
    grade[i][s1] = grade[i - 1][s1] + 1
  } else {
    grade[i][s1] = 1
  }

  if grade[i - 1][s2] > 0 {
    grade[i][s2] = grade[i - 1][s2] + 1
  } else {
    grade[i][s2] = 1
  }

  grade[n][s1] = max(grade[n][s1], grade[i][s1])
  grade[n][s2] = max(grade[n][s2], grade[i][s2])
}

var cnt = 0, ans = 0

for i in 0 ..< 5 {
  if grade[n][i] > cnt {
    cnt = grade[n][i]
    ans = i + 1
  }
}

print(cnt, ans)
