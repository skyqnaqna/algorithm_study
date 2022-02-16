/*
 프로그래머스 k진수에서 소수 개수 구하기
 22.02.16
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func isPrime(_ num: Int) -> Bool {
  if num == 1 { return false }
  if num == 2 || num == 3 { return true }
  
  for i in 2 ... Int(sqrt(Double(num))) {
    if num % i == 0 { return false }
  }
  
  return true
}

func solution(_ n:Int, _ k:Int) -> Int {
  var res = 0
  let convert = String(n, radix: k)
  let nums = convert.split(separator: "0").map { Int($0)! }
  print(nums)
  
  for num in nums {
    if isPrime(num) { res += 1 }
  }
  
  return res
}

print(solution(10111100110, 10))
