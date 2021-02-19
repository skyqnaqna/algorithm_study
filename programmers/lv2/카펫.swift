// 프로그래머스 카펫
// 21.02.18

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
  let xy = brown + yellow
  var x = brown + yellow
  var y = xy / x
  
  while true {
    if xy % x == 0 && (x - 2) * (y - 2) == yellow { break }
    x -= 1
    y = xy / x
  }
  return [x, y]
}

print(solution(24, 24))
