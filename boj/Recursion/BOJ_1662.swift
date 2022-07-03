/*
 백준 1662 압축
 22.07.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let str = readLine()!.map { String($0) }
let n = str.count

var isVisited = [Bool](repeating: false, count: n)

func recursive(_ idx: Int, _ pre: String, _ len: Int) -> Int {
  if idx == n { return len }
  
  isVisited[idx] = true
  
  if str[idx] == "(" {
    let res = len - 1 + Int(pre)! * recursive(idx + 1, str[idx], 0)
    
    for i in idx ..< n {
      if !isVisited[i] {
        return res + recursive(i, str[i], 0)
      }
    }
    
    return res
  } else if str[idx] == ")" {
    return len
  } else {
    return recursive(idx + 1, str[idx], len + 1)
  }
}

print(recursive(0, "", 0))
