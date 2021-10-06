/*
 21.10.06
 백준 6996 애너그램
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var t = Int(readLine()!)!

func output(_ isEqual: Bool, _ a: String, _ b: String) {
  if isEqual {
    print("\(a) & \(b) are anagrams.")
  } else {
    print("\(a) & \(b) are NOT anagrams.")
  }
}

while t > 0 {
  t -= 1
  var dicA = [String: Int](), dicB = [String: Int]()
  
  let input = readLine()!.split(separator: " ").map { String($0) }
  
  let a = input[0], b = input[1]
  
  for s in a {
    dicA[String(s), default: 0] += 1
  }
  
  for s in b {
    dicB[String(s), default: 0] += 1
  }
  
  var flag = true
  for (key, val) in dicA {
    if dicB[key] == nil || dicB[key] != val {
      flag = false
      break
    }
  }
  
  output(flag, a, b)
}
