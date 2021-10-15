/*
 21.10.15
 백준 7795 먹을 것인가 먹힐 것인가
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!
var answer = ""

while t > 0 {
  t -= 1
  
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  let n = input[0], m = input[1]
  
  let a = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
  let b = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
  
  var pa = 0, pb = 0, res = 0
  
  while pa < n && pb < m {
    
    if a[pa] <= b[pb] {
      while pa < n && a[pa] <= b[pb] {
        pa += 1
      }
      continue
    }
    
    res += n - pa
    pb += 1
  }
  
  answer += "\(res)\n"
}

print(answer)
