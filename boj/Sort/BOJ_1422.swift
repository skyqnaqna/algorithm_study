// 백준 1422 숫자의 신
// 21.04.18

import Foundation

let kn = readLine()!.split(separator: " ").map { Int(String($0))! }
var m = kn[1] - kn[0]
var nums = [String]()
var maxNum = 0

for _ in  1...kn[0] {
  let i = readLine()!
  nums.append(i)
  
  if maxNum < Int(i)! { maxNum = Int(i)! }
}

nums.sort(by: { $0 + $1 > $1 + $0 })

var answer = ""

if nums[0] == "0" {
  print(0)
} else {
  for s in nums {
    if m > 0 && s == String(maxNum) {
      while m > 0 {
        answer += s
        m -= 1
      }
    }
    answer += s
  }
  print(answer)
}

