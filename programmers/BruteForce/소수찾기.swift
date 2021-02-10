//  프로그래머스 소수 찾기
//  21.02.11

import Foundation

var numSet = Set<Int>()
var s: String = ""
var check = Array(repeating: false, count: 7)

func permutation(_ cnt: Int, _ r: Int, _ nums: [Character]) {
  if cnt == r {
    numSet.insert(Int(s)!)
    return
  }
  for i in 0..<nums.count {
    if !check[i] {
      check[i] = true
      s += String(nums[i])
      permutation(cnt + 1, r, nums)
      check[i] = false
      s.remove(at: s.index(before: s.endIndex))
    }
  }
}

func getPrime(_ number: Int) -> Bool {
  if number <= 1 { return false }
  else if number == 2 { return true }
  
  for i in stride(from: 2, to: Int(sqrt(Double(number))), by: 1) {
    if number % i == 0 { return false }
  }
  return true
}

func solution(_ numbers:String) -> Int {
  let nums = Array(numbers)

  for i in 1...numbers.count {
    permutation(0, i, nums)
  }
  
  var ans = 0
  for n in numSet {
    if getPrime(n) { ans += 1 }
  }
  
  return ans
}

print(solution("011"))
