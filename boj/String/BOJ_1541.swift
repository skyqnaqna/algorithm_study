/*
 백준 1514 잃어버린 괄호
 21.08.10
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!
var nums = [Int](), oper = [Character]()
var num = ""

for ch in input {
  if ch == "+" || ch == "-" {
    nums.append(Int(num)!)
    num = ""
    oper.append(ch)
  } else {
    num.append(ch)
  }
}
nums.append(Int(num)!)

var ans = nums[0]
var negative = false
for i in oper.indices {
  if oper[i] == "-" {
    negative = true
  }

  if negative {
    ans -= nums[i + 1]
  } else {
    ans += nums[i + 1]
  }
}

print(ans)