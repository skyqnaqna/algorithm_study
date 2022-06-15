/*
 백준 3151 합이 0
 22.06.15
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var students = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)

var answer = 0

for i in students.indices {
  
  var l = i + 1, r = n - 1
  
  while l < r {
    let sum = students[i] + students[l] + students[r]
    
    if sum == 0 {
      var nl = l + 1, nr = r - 1
      var lCnt = 1, rCnt = 1
      
      while nl < r && students[nl] == students[l] {
        lCnt += 1
        nl += 1
      }
      
      if students[l] == students[r] {
        lCnt += 1
        answer += lCnt * (lCnt - 1) / 2
      } else {
        while l < nr && students[nr] == students[r] {
          rCnt += 1
          nr -= 1
        }
        
        answer += lCnt * rCnt
      }
      
      l = nl
      r = nr
    } else if sum < 0 {
      l += 1
    } else {
      r -= 1
    }
  }
}

print(answer)
