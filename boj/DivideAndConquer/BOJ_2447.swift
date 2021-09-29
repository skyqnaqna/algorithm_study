/*
 21.09.30
 백준 2447 별 찍기 10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!
var star = [[String]](repeating: [String](repeating: "*", count: n), count: n)


func recursive(_ r: Int, _ c: Int, _ size: Int) {
  if size == 3 {
    star[r + size / 3][c + size / 3] = " "
    return
  }
  
  for i in stride(from: r, to: r + size, by: size / 3) {
    for j in stride(from: c, to: c + size, by: size / 3) {
      
      if i == (r + size / 3) && j == (c + size / 3) {
        
        for y in 0 ..< size / 3 {
          for x in 0 ..< size / 3 {
            star[i + y][j + x] = " "
          }
        }
        
        continue
      }
      
      recursive(i, j, size / 3)
    }
  }
}

recursive(0, 0, n)

var answer = ""
for i in 0 ..< n {
  answer += star[i].joined() + "\n"
}

print(answer)
