/*
 백준 3107 IPv6
 21.12.02
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let addr = readLine()!

let group = addr.components(separatedBy: "::")

var result = [String](repeating: "0000", count: 8)

func fillZero(_ str: String) -> String {
  var res = ""
  
  if str.count < 4 {
    for _ in 0 ..< 4 - str.count {
      res += "0"
    }
    res += str
    return res
  } else {
    return str
  }
}

if group.count == 1 {
  let arr = addr.split(separator: ":").map { String($0) }
  for i in 0 ..< 8 {
    result[i] = fillZero(arr[i])
  }
} else {
  let left = group[0].split(separator: ":").map { String($0) }
  let right = group[1].split(separator: ":").map { String($0) }
  let start = left.count, end = 7 - right.count + 1
  
  for i in 0 ..< start {
    result[i] = fillZero(left[i])
  }
  
  for i in end ..< 8 {
    result[i] = fillZero(right[i - end])
  }
}


print(result.map { $0 }.joined(separator: ":"))

