/*
 21.10.10
 백준 5430 AC
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!
var answer = ""

while t > 0 {
  t -= 1
  
  let p  = readLine()!.map { String($0) }
  
  var n = Int(readLine()!)!
  
  var str = readLine()!
  str.removeFirst()
  str.removeLast()
  var arr = str.split(separator: ",").map { String($0) }
  
  var res = "["
  var reverse = false
  var left = 0, right = n - 1
  
  for op in p {
    if op == "R" {
      reverse = !reverse
    } else {
      if n == 0 {
        res = ""
        answer += "error\n"
        break
      }
      
      if reverse {
        right -= 1
      } else {
        left += 1
      }
      
      n -= 1
    }
  }
  
  if res.isEmpty {
    continue
  }
  
  if reverse {
    for i in stride(from: right, through: left, by: -1) {
      res += arr[i] + ","
    }
//    res += arr.reversed().joined(separator: ",")
  } else {
    for i in stride(from: left, through: right, by: 1) {
      res += arr[i] + ","
    }
//    res += arr.joined(separator: ",")
  }
  if res.last! == "," {
    res.removeLast()
  }
  res += "]\n"
  
  answer += res
}

print(answer)
