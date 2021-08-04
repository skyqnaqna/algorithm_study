/*
 백준 9012 괄호
 21.08.04
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

for _ in 0 ..< n {
  let str = readLine()!
  var cnt = 0
  var valid = true
  for ch in str {
    if ch == "(" {
      cnt += 1
    } else {
      if cnt == 0 {
        cnt += 1
        break
      } else {
        cnt -= 1
      }
    }
  }
  if cnt > 0 {
    print("NO")
  } else {
    print("YES")
  }
}