/*
 kakao22 - 2
 21.09.11
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
  var answer = 0
  let converted = String(n, radix: k).map{ String($0) }

  func isPrime(_ str: String) -> Bool {
    if str.contains("0") {
      return false
    }
    let num = Int(str)!
    if num == 1 {
      return false
    } else if num == 2 || num == 3 {
      return true
    }

    let sqrtNum = Int(sqrt(Double(num)))

    for i in 2 ... sqrtNum {
      if num % i == 0 {
        return false
      }
    }

    return true
  }

  var num = ""
  for digit in converted {
    if digit != "0" {
      num += digit
    } else {
      if num != "" && isPrime(num) {
        answer += 1
      }
      num = ""
    }
  }

  if num != "" && isPrime(num) {
    answer += 1
  }

  return answer
}