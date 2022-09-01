/*
 백준 9375 패션왕 신해빈
 22.09.01
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let t = Int(readLine()!)!
var answer = ""

for _ in 0 ..< t {
  let n = Int(readLine()!)!

  var res = 1
  var type = [String: Int]()

  for _ in 0 ..< n {
    let arr = readLine()!.split(separator: " ").map { String($0) }
    type[arr[1], default: 0] += 1
  }

  for val in type.values {
    res *= (val + 1)
  }

  answer += "\(res - 1)\n"
}

print(answer)
