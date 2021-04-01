// 백준 1439 뒤집기
// 21.04.01

import Foundation

let str = Array(readLine()!)

var cnt = 0

let pre = str[0]
var idx = 1

while idx < str.count {
  if str[idx] == pre {
    idx += 1
    continue
  }
  else {
    cnt += 1
    idx += 1
    while idx < str.count && str[idx] != pre {
      idx += 1
      }
    }
  }

print(cnt)
