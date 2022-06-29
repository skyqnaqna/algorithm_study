/*
 백준 12919 A와 B 2
 22.06.29
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let s = readLine()!
let t = readLine()!

var answer = 0

func solution(_ str: String) {
  if answer > 0 { return }
  if str.count == s.count {
    if str == s {
      answer = 1
    }
    
    return
  }
  
  if str.last! == "A" {
    var next = str
    next.removeLast()
    
    solution(next)
  }
  
  if str.first! == "B" {
    var next = str
    next = String(next.reversed())
    next.removeLast()
    
    solution(next)
  }
}

solution(t)
print(answer)
