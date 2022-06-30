/*
 백준 1254 팰린드롬 만들기
 22.06.30
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var s = readLine()!

if s == String(s.reversed()) { print(s.count) }
else {
  let str = s.map { String($0) }
  
  var temp = "", suffix = str[0]
  for i in stride(from: str.count - 1, to: 0, by: -1) {
    temp += str[i]
  }
  
  while !temp.isEmpty {
    if temp == String(temp.reversed()) { break }
    
    suffix.append(temp.removeLast())
  }
  
  s += String(suffix.reversed())
  
  print(s.count)
}
