/*
 21.10.25
 백준 6603 로또
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var answer = ""

while true {
  let s = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  if s[0] == 0 { break }
  
  let k = s[0]
  var arr = [Int]()
  
  func recursive(_ idx: Int, _ cnt: Int) {
    if cnt == 6 {
      answer += arr.map { String($0) }.joined(separator: " ")
      answer += "\n"
      return
    }
    
    if idx > k { return }
    
    for i in idx ... k {
      arr.append(s[i])
      recursive(i + 1, cnt + 1)
      arr.removeLast()
    }
  }
  
  recursive(1, 0)
  
  answer += "\n"
}

print(answer)
