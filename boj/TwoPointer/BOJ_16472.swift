/*
 백준 16472 고냥이
 21.08.24
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
let str = Array(readLine()!)
var alphabet = [Int](repeating: 0, count: 26)

var l = 0, r = 0, ans = 0, cnt = 0

func atoi(_ ch: Character) -> Int {
  return Int(ch.asciiValue! - Character("a").asciiValue!)
}

while l < str.count {
  if r == str.count {
    alphabet[atoi(str[l])] -= 1
    if alphabet[atoi(str[l])] == 0 {
      cnt -= 1
    }
    l += 1
  } else if cnt <= n {
    if alphabet[atoi(str[r])] == 0 {
      cnt += 1
    }
    alphabet[atoi(str[r])] += 1
    r += 1
  } else if cnt > n {
    if alphabet[atoi(str[l])] == 1 {
      cnt -= 1
    }
    alphabet[atoi(str[l])] -= 1
    l += 1
  }

  if cnt <= n {
    ans = max(ans, r - l)
  }
}

print(ans)