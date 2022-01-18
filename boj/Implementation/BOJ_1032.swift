/*
 백준 1032 명령 프롬프트
 22.01.19
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

var arr = readLine()!.map { String($0) }

for _ in 1 ..< n {
  let input = readLine()!.map { String($0) }
  
  for i in arr.indices {
    if arr[i] == "?" { continue }
    if arr[i] != input[i] {
      arr[i] = "?"
    }
  }
}

print(arr.map { $0 }.joined())
