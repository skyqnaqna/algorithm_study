/*
 백준 15665 N과 M (11)
 21.12.03
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var nums = Array(Set(arr)).sorted()

var combination = [Int]()
var answer = ""

func recursive(_ cnt: Int) {
  if cnt == m {
    answer += combination.map { String($0) }.joined(separator: " ") + "\n"
    
    return
  }
  
  for i in 0 ..< nums.count {
    combination.append(nums[i])
    recursive(cnt + 1)
    combination.removeLast()
  }
}

recursive(0)

print(answer)

