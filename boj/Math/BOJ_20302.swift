/*
 21.10.29
 백준 20302 민트 초코
 https://github.com/skyqnaqna/algorithm_study
 */

import Foundation

let a = readLine()!
let arr = readLine()!.split(separator: " ").map { String($0) }

var prime = [Int](repeating: 0, count: 100001)
var numerator = true

func factorization (_ num: Int) {
  let n = Int(sqrt(Double(num))) + 1
  var x = num
  
  for i in 2 ... n {
    while x % i == 0 {
      x /= i
      if numerator { prime[i] += 1 }
      else { prime[i] -= 1 }
    }
  }
  
  if x > 1 {
    if numerator { prime[x] += 1 }
    else { prime[x] -= 1 }
  }
}

func main() {
  for i in 0 ..< arr.count {
    if arr[i] == "0" {
      print("mint chocolate")
      return
    }
    
    if i % 2 == 0 {
      factorization(abs(Int(arr[i])!))
    } else {
      numerator = arr[i] == "*"
    }
  }
  
  for i in 2 ..< prime.count {
    if prime[i] < 0 {
      print("toothpaste")
      return
    }
  }
  
  print("mint chocolate")
}

main()
