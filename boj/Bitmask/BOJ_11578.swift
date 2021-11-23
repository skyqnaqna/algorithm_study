/*
 백준 11578 팀원 모집
 21.11.23
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let allSolved = (1 << n) - 1, combination = (1 << m)

var student = [[Int]](repeating: [Int](), count: m)

for i in 0 ..< m {
  student[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var answer = m + 1

for combi in 1 ... combination {
  var i = 0, cnt = 0, solving = 0
  
  while i < m {
    if (combi & (1 << i)) != 0 {
      cnt += 1
      
      for j in 1 ..< student[i].count {
        let problem = student[i][j] - 1
        
        solving |= (1 << problem)
      }
    }
    i += 1
  }
  
  if solving == allSolved {
    answer = min(answer, cnt)
  }
}

if answer == m + 1 { answer = -1 }

print(answer)
