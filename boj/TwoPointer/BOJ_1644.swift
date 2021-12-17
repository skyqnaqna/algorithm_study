/*
 백준 1644 소수의 연속합
 21.12.17
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let n = Int(readLine()!)!

if n == 1 {
  print(0)
} else {
  var isPrime = [Bool](repeating: true, count: n + 1)
  var prime = [Int]()
  
  for i in 2 ... n {
    if isPrime[i] {
      prime.append(i)
      
      var j = 2
      while i * j <= n {
        isPrime[i * j] = false
        j += 1
      }
    }
  }
  
  var l = 0, r = 0, sum = 0, answer = 0
  
  while l < prime.count {
    if r == prime.count {
      sum -= prime[l]
      l += 1
      
      if sum == n {
        answer += 1
      }
    } else {
      if sum < n {
        sum += prime[r]
        r += 1
      } else if sum >= n {
        sum -= prime[l]
        l += 1
      }
      
      if sum == n {
        answer += 1
      }
    }
  }
  
  print(answer)
}

