/*
 백준 1343 폴리오미노
 21.12.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let arr = readLine()!.map { String($0) }

var answer = "", cnt = 0, valid = true

for i in arr.indices {
  if arr[i] == "." {
    if cnt > 0 && cnt != 2 {
      valid = false
      break
    } else if cnt == 2 {
      answer += "BB"
      cnt = 0
    }
    answer += "."
    
  } else {
    cnt += 1
    if cnt == 4 {
      answer += "AAAA"
      cnt = 0
    }
  }
}

if cnt > 0 && cnt != 2 {
  valid = false
} else if cnt == 2 {
  answer += "BB"
}

if valid {
  print(answer)
} else {
  print(-1)
}
