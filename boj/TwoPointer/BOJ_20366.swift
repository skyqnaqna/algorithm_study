/*
 백준 20366 같이 눈사람 만들래?
 22.06.30
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var balls = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted(by: <)
var heights = [Int: [[Int]]]()

var answer = Int.max

for body in stride(from: n - 1, through: 3, by: -1) {
  for head in 0 ..< body {
    let height1 = balls[head] + balls[body]
    
    var l = head + 1, r = body - 1
    
    while l < r {
      let height2 = balls[l] + balls[r]
      
      if abs(height1 - height2) < answer { answer = abs(height1 - height2) }
      
      if height1 < height2 {
        r -= 1
      } else {
        l += 1
      }
    }
  }
}

print(answer)
