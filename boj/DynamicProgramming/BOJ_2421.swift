/*
 백준 2421 저금통
 22.05.20
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

var prime = [Bool](repeating: true, count: 1000000)
var dp = [[Int]](repeating: [Int](repeating: -1, count: 1000), count: 1000)

prime[0] = false
prime[1] = false

for i in 2 ... 1000 {
  if prime[i] {
    var j = 2
    
    while i * j < 1000000 {
      prime[i * j] = false
      j += 1
    }
  }
}

prime[11] = false

let n = Int(readLine()!)!

func recursive(_ a: String, _ b: String) -> Int {
  let intA = Int(a)!, intB = Int(b)!
  
  if n < intA || n < intB {
    return 0
  }
  
  if intA == n && intB == n {
    if prime[Int(a + b)!] {
      return 1
    }
    
    return 0
  }
  
  if dp[intA][intB] != -1 {
    return dp[intA][intB]
  }
  
  dp[intA][intB] = 0
  
  if prime[Int(a + b)!] {
    dp[intA][intB] += 1
  }
  
  dp[intA][intB] += max(recursive(String(intA + 1), b), recursive(a, String(intB + 1)))
  
  return dp[intA][intB]
}

print(recursive("1", "1"))

