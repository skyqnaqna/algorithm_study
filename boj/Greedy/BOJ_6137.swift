/*
 백준 6137 문자열 생성
 22.06.07
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var s = [String](), t = [String]()

for _ in 0 ..< n {
  s.append(readLine()!)
}

var l = 0, r = n - 1

while l <= r {
  var left = l, right = r
  
  if left != right && s[left] == s[right] {
    while left < n && 0 <= right && s[left] == s[right] {
      left += 1
      right -= 1
    }
  }
  
  if left == n || right < 0 || s[left] <= s[right] {
    t.append(s[l])
    l += 1
  } else {
    t.append(s[r])
    r -= 1
  }
}

var answer = ""
for i in t.indices {
  answer += t[i]
  
  if (i + 1) % 80 == 0 {
    answer += "\n"
  }
}

print(answer)
