/*
 백준 13022 늑대와 올바른 단어
 22.02.20
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let str = readLine()!.map { String($0) }
var len = [Int]()

func makeWord(_ n: Int) -> String {
  var res = ""
  
  for _ in 0 ..< n {
    res += "w"
  }
  for _ in 0 ..< n {
    res += "o"
  }
  for _ in 0 ..< n {
    res += "l"
  }
  for _ in 0 ..< n {
    res += "f"
  }
  
  return res
}

var cnt = 0
for i in 0 ..< str.count {
  if str[i] == "w" {
    cnt += 1
  } else {
    len.append(cnt)
    cnt = 0
  }
}

var res = ""
for n in len {
  res += makeWord(n)
}

if res == str.joined(separator: "") {
  print(1)
} else {
  print(0)
}
