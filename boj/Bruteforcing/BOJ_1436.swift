/*
 백준 1436 영화감독 숌
 22.01.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var res = Set<String>()

res.insert("666")

while res.count < n * 2 {
  for i in res {
    for j in 0 ..< 10 {
      res.insert(i + String(j))
      res.insert(String(j) + i)
    }
  }
}

var ans = Set<Int>()
for i in res {
  ans.insert(Int(i)!)
}

let answer = Array(ans).sorted()

print(answer[n - 1])
