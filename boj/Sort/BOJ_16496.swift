// 백준 16496 큰 수 만들기
// 21.04.18

import Foundation

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { String($0) }

nums.sort(by: { $0 + $1 > $1 + $0 })

var answer = ""

if nums[0] == "0" {
  print(0)
} else {
  for s in nums {
    answer += s
  }
  print(answer)
}

